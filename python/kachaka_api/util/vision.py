import contextlib
import io
import threading
from typing import Generator, List, Optional

import grpc
import numpy as np
from google._upb._message import RepeatedCompositeContainer
from PIL import Image, ImageDraw, ImageFont

from ..generated import kachaka_api_pb2 as pb2
from ..generated.kachaka_api_pb2_grpc import KachakaApiStub

OBJECT_LABEL = ["?", "person", "shelf", "charger", "door"]
OBJECT_LABEL_COLOR = ["pink", "green", "blue", "cyan", "red"]


class LaserScanActivator:
    def __init__(self, target: str = "100.94.1.1:26400") -> None:
        self._stub = KachakaApiStub(grpc.insecure_channel(target))
        self._thread: Optional[threading.Thread] = None
        self._disposing = threading.Event()

    @contextlib.contextmanager
    def activate(self) -> Generator[None, None, None]:
        try:
            self._start()
            yield
        except Exception as e:
            raise e
        finally:
            self._stop()

    def _activation_loop(
        self,
        duration_sec: float = 5.0,
        publish_rate: float = 1.0,
    ) -> None:
        request = pb2.ActivateLaserScanRequest(duration_sec=duration_sec)
        wait_timeout = 1 / publish_rate
        while not self._disposing.is_set():
            self._stub.ActivateLaserScan(request)
            self._disposing.wait(timeout=wait_timeout)

    def _stop(self) -> None:
        if self._thread:
            self._disposing.set()
            self._thread.join()

    def _start(self) -> None:
        self._disposing.clear()
        self._thread = threading.Thread(target=self._activation_loop)
        self._thread.start()


def get_bbox_drawn_image(
    image: pb2.RosImage, objects: RepeatedCompositeContainer
) -> Image.Image:
    img = Image.open(io.BytesIO(image.data))
    draw = ImageDraw.Draw(img)
    font = ImageFont.load_default()
    for obj in objects:
        x, y, w, h = (
            obj.roi.x_offset,
            obj.roi.y_offset,
            obj.roi.width,
            obj.roi.height,
        )
        draw.rectangle(
            [x, y, x + w, y + h], outline=OBJECT_LABEL_COLOR[obj.label], width=4
        )
        draw.text(
            (x + 10, y + 10),
            f"{OBJECT_LABEL[obj.label]}, score={obj.score:.2f}",
            font=font,
            fill=OBJECT_LABEL_COLOR[obj.label],
        )
    return img


def get_bbox_drawn_image_with_user_labels(
    image: pb2.RosImage,
    label_names: List[str],
    bboxes: np.ndarray,
    labels: np.ndarray,
    colors: List[str],
    scores: np.ndarray,
    scale_h: float,
    scale_w: float,
    score_threshold: float,
) -> Image.Image:
    img = Image.open(io.BytesIO(image.data))
    draw = ImageDraw.Draw(img)
    font = ImageFont.load_default()
    for label, score, bbox in zip(labels, scores, bboxes):
        if score < score_threshold:
            continue
        y1 = int(bbox[0] * scale_h)
        x1 = int(bbox[1] * scale_w)
        y2 = int(bbox[2] * scale_h)
        x2 = int(bbox[3] * scale_w)
        draw.rectangle([x1, y1, x2, y2], outline=colors[label], width=4)
        draw.text(
            (x1 + 10, y1 + 10),
            f"{label_names[label]}, score={score:.2f}",
            font=font,
            fill=colors[label],
        )
    return img

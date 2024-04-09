import io
from typing import List

import numpy as np
from google._upb._message import RepeatedCompositeContainer
from PIL import Image, ImageDraw, ImageFont

from ..generated import kachaka_api_pb2 as pb2

OBJECT_LABEL = ["?", "person", "shelf", "charger", "door"]
OBJECT_LABEL_COLOR = ["pink", "green", "blue", "cyan", "red"]


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

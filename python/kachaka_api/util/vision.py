import io

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

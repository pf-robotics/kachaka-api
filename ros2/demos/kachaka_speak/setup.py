from setuptools import setup

package_name = "kachaka_speak"

setup(
    name=package_name,
    version="0.0.0",
    packages=[package_name],
    data_files=[
        (
            "share/ament_index/resource_index/packages",
            ["resource/" + package_name],
        ),
        ("share/" + package_name, ["package.xml"]),
    ],
    install_requires=["setuptools"],
    zip_safe=True,
    maintainer="Kachaka Customer Support",
    maintainer_email="support@kachaka.life",
    description="kachaka ROS2 sample speak",
    license="TODO: License declaration",
    tests_require=["pytest"],
    entry_points={
        "console_scripts": [
            "speak = kachaka_speak.speak:main",
        ],
    },
)

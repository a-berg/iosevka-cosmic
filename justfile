build_name := "iosevka-cosmic"
# build_name_tc := replace(titlecase(build_name), " ", "-")
install_dir := "~/.local/share/fonts/"
target := "super-ttc"
version := "21.0.0"

default:
    @just --list --unsorted

# build all 3 fonts & install them
build-all: cosmic milky andromeda install

# build Iosevka Cosmic (monospaced)
cosmic:
    docker run -e FONT_VERSION={{version}} -it -v \
      {{invocation_directory()}}:/build avivace/iosevka-build \
      {{target}}::{{build_name}}

# build Iosevka MilkyWay (quasi-proportional; sans-serif)
milky:
    docker run -e FONT_VERSION={{version}} -it -v \
      {{invocation_directory()}}:/build avivace/iosevka-build \
      {{target}}::{{build_name}}-proportional

# build Iosevka Andromeda (quasi-proportional; serif)
andromeda:
    docker run -e FONT_VERSION={{version}} -it -v \
      {{invocation_directory()}}:/build avivace/iosevka-build \
      {{target}}::{{build_name}}-slab

# install fonts to {{install_dir}}.
install:
    find dist/.{{target}} -path '*.ttc' -exec cp '{}' {{install_dir}} \;
    fc-cache -f -v

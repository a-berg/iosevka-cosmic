alias b := build

build_name := 'iosevka-cosmic'
build_name_tc := replace(titlecase(build_name), " ", "-")
default_target := "super-ttc"
version := "21.0.0"

build target=default_target:
    docker run -e FONT_VERSION={{version}} -it -v \
      {{invocation_directory()}}:/build avivace/iosevka-build \
      {{target}}::{{build_name}}

install:
    # mkdir -p ~/.local/share/fonts/{{build_name_tc}}
    # rm -rf ~/.local/share/fonts/{{build_name_tc}}/*
    find dist/.{{default_target}} -path '*.ttc' -exec cp '{}' ~/.local/share/fonts/ \;
    fc-cache -f -v

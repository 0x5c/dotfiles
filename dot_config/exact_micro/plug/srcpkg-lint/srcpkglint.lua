VERSION = "1.0.0"

function preinit()
    --linter.makeLinter("pkg-shellcheck", "srcpkg", "shellcheck", {"-f", "gcc", "-s", "bash", "%f"}, "%f:%l:%c:.+: %m")
    linter.makeLinter("xlint", "srcpkg", "xlint", {"%f"}, "%f:%l: %m")
end

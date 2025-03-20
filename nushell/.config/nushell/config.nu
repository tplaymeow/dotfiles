# Env setup

$env.config.buffer_editor = "vi"
$env.path ++= [
  "/usr/local/bin",
  "/opt/homebrew/bin",
  "/usr/local/go/bin",
]

# Zoxide

source zoxide.nu

# Yazi setup

def --env y [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")
	yazi ...$args --cwd-file $tmp
	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}
	rm -fp $tmp
}

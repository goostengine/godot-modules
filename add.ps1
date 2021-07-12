$name = $args[0]
$url = $args[1]
$branch = $args[2]

git submodule add --force --name "$name" --branch "$branch" "$url" "modules/$name"



$p = [Permission]::new("p1")

$r = [Role]::new("r1")

$r.AddPermission($p)
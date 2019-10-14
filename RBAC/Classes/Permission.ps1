class Permission {
    [string]
    $Name
    [guid]
    $ID
    [string]
    $Description

    Permission([string]$name) {
        $this.name = $name
        $this.ID = (New-Guid)
    }

    Permission([string]$name, [string]$Description) {
        $this.name = $name
        $this.Description = $Description
        $this.ID = (New-Guid)
    }
}

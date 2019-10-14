class Role {
    [string]
    $Name
    [guid]
    $ID
    [string]
    $Description
    [hashtable]
    $Permissions = @{ }

    Role ([string]$Name) {
        $this.Name = $Name
        $this.ID = (New-Guid)
    }

    Role ([string]$Name, [string]$Description) {
        $this.Name = $Name
        $this.Description = $Description
        $this.ID = (New-Guid)
    }

    [void]AddPermission([Permission]$Permission) {
        if (! $this.Permissions.ContainsKey($Permission.ID)) {
            $this.Permissions.Add($Permission.ID, $Permission)
        }
        else {
            Write-Warning "The permission $($Permission.Name) is already in role $($this.Name)."
        }
    }

    [void]RemovePermission([Permission]$Permission) {
        if ($this.Permissions.ContainsKey(($Permission.ID))) {
            $this.Permissions.Remove($Permission) 
        }
        else {
            Write-Warning "The permission $($Permission.Name) is not in role $($this.Name)."
        }
    }
}

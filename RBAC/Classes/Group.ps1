class Group {
    [string]
    $Name
    [guid]
    $ID
    [string]
    $Description
    [hashtable]
    $Members = @{ }
    [hashtable]
    $Roles = @{ }

    Group ([string]$Name) {
        $this.Name = $Name
        $this.ID = (New-Guid)
    }

    Group ([string]$Name, [string]$Description) {
        $this.Name = $Name
        $this.Description = $Description
        $this.ID = (New-Guid)
    }

    [void]AddRole([Role]$Role) {
        if (!$this.Roles.ContainsKey($Role.ID)) {
            $this.Roles.Add($Role.ID, $Role)
        }
        else {
            Write-Warning "Role $($Role.Name) is already in group $($this.Name)."
        }
    }
    [void]RemoveRole() { }
    [void]AddMember() { }
    [void]RemoveMember() { }
}
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
    [void]RemoveRole([Role]$Role) {
        if ($this.Roles.ContainsKey($Role.ID)) {
            $this.Roles.Remove($Role)
        }
        else {
            Write-Warning "Role $($Role.Name) is not in group $($this.Name)."
        }
    }
    [void]AddMember([User]$User) {
        if (!$this.Members.ContainsKey($User.ID)) {
            $this.Members.Add($User.ID, $User)
        }
        else {
            Write-Warning "User $($User.Name) is already in group $($this.Name)."
        }
    }
    [void]RemoveMember([User]$User) {
        if ($this.Members.ContainsKey($User.ID)) {
            $this.Members.Remove($User.ID, $User)
        }
        else {
            Write-Warning "User $($User.Name) is not in group $($this.Name)."
        }
    }
}
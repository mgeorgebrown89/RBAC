class User {
    [string]
    $ID
    [string]
    $UserName

    User([string]$ID, [string]$UserName) {
        $this.ID = $ID
        $this.UserName = $UserName
    }
}

class SlackUser : User {
    
}
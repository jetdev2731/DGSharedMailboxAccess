# Add members to Distribution Group
$members = @("member1@domain.com", "member2@domain.com", "member10@domain.com")
foreach ($m in $members) {
    Add-DistributionGroupMember -Identity "Sales Team" -Member $m
}

# Assign Send As & Full Access to all DG members
foreach ($m in $members) {
    Add-MailboxPermission -Identity "salesteam@domain.com" -User $m -AccessRights FullAccess -InheritanceType All
    Add-ADPermission -Identity "Sales Team" -User $m -ExtendedRights "Send As"
}

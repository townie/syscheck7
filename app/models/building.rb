class Building < ActiveRecord::Base

  validates :street_address,  presence: true
  validates :city,            presence: true, format: {with: /^[a-zA-Z\s]+$/, multiline: true}
  validates :state,           presence: true, format: {with: /^([Aa][LKSZRAEPlkszraep]|[Cc][AOTaot]|[Dd][ECec]|[Ff][LMlm]|[Gg][AUau]|HI|hi|[Ii][ADLNadln]|[Kk][SYsy]|LA|la|[Mm][ADEHINOPSTadehinopst]|[Nn][CDEHJMVYcdehjmvy]|[Oo][HKRhkr]|[Pp][ARWarw]|RI|ri|[Ss][CDcd]|[Tt][NXnx]|UT|ut|[Vv][AITait]|[Ww][AIVYaivy])$/,
    message: "Two letter abreviations please" , multiline: true }
  validates :postal_code,     presence: true


end

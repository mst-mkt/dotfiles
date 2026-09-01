{
  features = [
    "cli"
    "gui"
    "dev"
    "game"
    "iniad"
  ];
  defaultByHostType = {
    laptop = [
      "cli"
      "gui"
    ];
    server = [
      "cli"
    ];
    mobile = [
      "cli"
    ];
  };
}

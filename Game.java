public class Game {
  
  private String name;
  private int energyDecrease;
  private int happinessIncrease;
  private int weightDecrease;
    
  Game(String name, int energyDecrease, int happinessIncrease, int weightDecrease){
    this.name = name;
    this.energyDecrease = energyDecrease;
    this.happinessIncrease = happinessIncrease;
    this.weightDecrease = weightDecrease;
  }
  
  public String getName(){return name;}
  public int getEnergy(){return energyDecrease;}
  public int getHappiness(){return happinessIncrease;}
  public int getWeight(){return weightDecrease;}
}

public class VirtualPet {
  
  private String name;
  private int energy;
  private int weight;
  private int happiness;
  private int age;

  public VirtualPet(String name){
    this.name = name;
    this.energy = 0;
    this.weight = 5;
    this.happiness = 0;
    this.age = 0;
  }

  public String getName(){return name;}
  public int getEnergy(){return energy;}
  public int getHappiness(){return happiness;}
  public int getWeight(){return weight;}
  public String getAge(){return (int) age/12 + " Years, " + age%12 + " Months" ;}

  public void feed(Food f){
    if (energy < 10){
      energy += f.getEnergy();
      happiness += f.getHappiness();
      weight += f.getWeight();
    }
  }

  public void play(Game g){
    if (happiness < 100){
      happiness += g.getHappiness();
    }
    if (weight > 5){
      weight -= g.getWeight();
    }
    if (energy >= g.getEnergy()){
      energy -= g.getEnergy();
    }
  }

  public void updateStatus(){
    if (happiness > 0){
      happiness--;
    }
    if (energy > 0){
      energy--;
    }
    if (weight > 5){
      weight --;
    }
    age++;
  }
  
  public void getFat(){
    weight = 10000;
  }
  
  public void bound(){
    if (energy > 10) { 
      energy = 10;
    }
    if (happiness >= 100) {
      happiness = 100;
    }
  }

  public String toString(){
    return name + "'s information: \nEnergy: " + energy 
    + "\nweight: " + weight + "\nHappiness: " + happiness
    + "\nAge: " + (int) age/12+ " years and " + age%12 + " months.";
  }
}

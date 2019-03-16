import java.util.ArrayList;
import java.util.Arrays;

public class test{
	public static void main(String [] args){
		ArrayList<Field> fields = new ArrayList<Field>();
		fields.add(new StringField("Ambiente",new ArrayList<String>(Arrays.asList("soleado", "nublado", "lluvia"))));
		fields.add(new StringField("Temperatura",new ArrayList<String>(Arrays.asList("alta", "media", "baja"))));
		fields.add(new StringField("Humedad",new ArrayList<String>(Arrays.asList("alta", "normal"))));
		fields.add(new BooleanField("Viento", new ArrayList<Boolean>(Arrays.asList(true, false))));
		fields.add(new BooleanField("Jugar", new ArrayList<Boolean>(Arrays.asList(true, false))));
		
		String targetDataSet = "data files/smoothingDebug.txt";
	
		KnowledgeSet targetKnowledge = new KnowledgeSet(fields); /* Create a KnowledgeSet with the corresponding fields */ 
		targetKnowledge.loadKnowledge(targetDataSet); /* Load target information into the KnowledgeSet */
		
		ArrayList<RandomVariable> targetNodes = new ArrayList<RandomVariable>();
		
		ArrayList<RandomVariable> ambienteParents = new ArrayList<RandomVariable>();
		ambienteParents.add(new RandomVariable("Temperatura",new String[]{"alta", "media", "baja"}));
		ambienteParents.add(new RandomVariable("Humedad",new String[]{"alta", "normal"}));
		
		ArrayList<RandomVariable> jugarParents = new ArrayList<RandomVariable>();
		jugarParents.add(new RandomVariable("Viento",new Boolean[]{true, false}));
		
		targetNodes.add(new RandomVariable("Ambiente",new String[]{"soleado", "nublado", "lluvia"}));
		targetNodes.add(new RandomVariable("Temperatura",new String[]{"alta", "media", "baja"}));
		targetNodes.add(new RandomVariable("Humedad",new String[]{"alta", "normal"}));
		targetNodes.add(new RandomVariable("Viento",new Boolean[]{true, false}));
		targetNodes.add(new RandomVariable("Jugar",new Boolean[]{true, false}));
		
		targetNodes.get(0).setParents(ambienteParents);
		targetNodes.get(4).setParents(jugarParents);
		
		TNBN targetModel = new TNBN(targetKnowledge,targetNodes);
		
		targetModel.calculateProbabilityTables();
		targetModel.calculateCPTs();
		targetModel.calculateCPTsGivenParents();
		
		ProbabilityDistribution p;
		//for(int i = 0; i < targetNodes.size(); ++i){
			p = targetNodes.get(0).getProbabilityDistribution();
			p.printCPT();
			System.out.println();
			p = targetNodes.get(4).getProbabilityDistribution();
			p.printCPT();
		//}
		/*ProbabilityDistribution Bprob = new ProbabilityDistribution("B", new String[]{"B0","B1"}, new double[]{0.3, 0.7});
		ProbabilityDistribution Cprob = new ProbabilityDistribution("C", new String[]{"C0","C1","C2"}, new double[]{0.2, 0.5,0.3});
	
		RandomVariable Bvar = new RandomVariable("B", new String[]{"B0","B1"}, Bprob);
		RandomVariable Cvar = new RandomVariable("B", new String[]{"C0","C1","C2"}, Cprob);
		
		ArrayList<RandomVariable> conditioningSet = new ArrayList<RandomVariable>();
		conditioningSet.add(Bvar);
		conditioningSet.add(Cvar);
	
		StringField B = new StringField("B", new ArrayList<String>(Arrays.asList("B0", "B1")));
		StringField C = new StringField("C", new ArrayList<String>(Arrays.asList("C0", "C1", "C2")));
		
		FieldValuePair B0 = new FieldValuePair(B, "B0");
		FieldValuePair B1 = new FieldValuePair(B, "B1");
		FieldValuePair C0 = new FieldValuePair(C, "C0");
		FieldValuePair C1 = new FieldValuePair(C, "C1");
		FieldValuePair C2 = new FieldValuePair(C, "C2");
		
		FieldValuePair [] B0C0 = {B0,C0};
		FieldValuePair [] B0C1 = {B0,C1};
		FieldValuePair [] B0C2 = {B0,C2};
		FieldValuePair [] B1C0 = {B1,C0};
		FieldValuePair [] B1C1 = {B1,C1};
		FieldValuePair [] B1C2 = {B1,C2};
		
		ValueProbability [][] cpt = new ValueProbability[2][6];
		
		cpt[0][0] = new ValueProbability("A0",B0C0,0.3);
		cpt[0][1] = new ValueProbability("A0",B0C1,0.2);
		cpt[0][2] = new ValueProbability("A0",B0C2,0.9);
		cpt[0][3] = new ValueProbability("A0",B1C0,0.7);
		cpt[0][4] = new ValueProbability("A0",B1C1,0.4);
		cpt[0][5] = new ValueProbability("A0",B1C2,0.5);
		cpt[1][0] = new ValueProbability("A1",B0C0,0.7);
		cpt[1][1] = new ValueProbability("A1",B0C1,0.8);
		cpt[1][2] = new ValueProbability("A1",B0C2,0.1);
		cpt[1][3] = new ValueProbability("A1",B1C0,0.3);
		cpt[1][4] = new ValueProbability("A1",B1C1,0.6);
		cpt[1][5] = new ValueProbability("A1",B1C2,0.5);
		
		ValueProbability [][] result = Probability.marginalizeOver (0, conditioningSet, cpt);
		
		Probability.printCPT("A",result);
		
		ArrayList<RandomVariable> conditioningSet2 = new ArrayList<RandomVariable>();
		conditioningSet2.add(Cvar);
		
		result = Probability.marginalizeOver (0, conditioningSet2, result);
		
		Probability.printCPT("A",result); */
		
		
		
		/*int numFields = 5;
		ArrayList<Field> fields = new ArrayList<Field>(numFields);
		ArrayList<Field> f, f1;
		
		ArrayList<FieldValuePair> g = new ArrayList<FieldValuePair>(2);
		
		
		
		fields.add(new StringField("Ambiente", new ArrayList<String>(Arrays.asList("soleado", "nublado", "lluvia"))));
		fields.add(new TemporalField("Temperatura", new ArrayList<Temporal>(Arrays.asList(new Temporal("[4-5]"), new Temporal("[6-7]"), new Temporal("[7-8]")))));
		
		g.add(new FieldValuePair(fields.get(0),"soleado"));
		FieldValuePair h = new FieldValuePair(fields.get(1), "[4-5]");
		FieldValuePair h1 = new FieldValuePair(fields.get(1), h.getValue());
		System.out.println(h1.getValue());
		g.add(h);
		
		Record r = new Record(g);
		
		h.setValue("[6-7]");
		
		ArrayList<FieldValuePair> x = r.getTuple();*/
		
		//for(int i = 0; i  < x.size(); ++i)
			//System.out.println(h1.getValue());
			
		//Temporal y = h.getValue().toString();
		

		//System.out.println(l.get(0));
		/*int numFields = 5;
		ArrayList<Field> fields = new ArrayList<Field>(numFields);
		ArrayList<Field> f, f1;
		
		fields.add(new StringField("Ambiente", new ArrayList<String>(Arrays.asList("soleado", "nublado", "lluvia"))));
		fields.add(new StringField("Temperatura", new ArrayList<String>(Arrays.asList("alta", "media", "baja"))));
		fields.add(new StringField("Humedad", new ArrayList<String>(Arrays.asList("alta", "normal"))));
		fields.add(new BooleanField("Viento", new ArrayList<Boolean>(Arrays.asList(true, false))));
		fields.add(new BooleanField("Jugar", new ArrayList<Boolean>(Arrays.asList(true, false))));
			
		KnowledgeSet k = new KnowledgeSet(fields);
		k.loadKnowledge("data files/golf.txt");
		
		k.printRecordAt(5);
		
		f = k.getFields();
		System.out.println(f.get(0).getFieldName());
		f.get(0).setFieldName("CHANGED");
		
		f1 = k.getFields();
		
		System.out.println(f1.get(0).getFieldName());*/
		
		/*CrossConditionalEntropy t = new CrossConditionalEntropy();
		String [] s = {"Jugar"};
		
		double result = t.cce(k, "Humedad", "Viento", s);
		System.out.println(result);*/
		
		/*Combinations c = new Combinations();
		ArrayList<Object []> sets;
		String [] values = {"A","B","C","D","E"};
		
		sets = c.getSets(values, 0, 5, 0, 2);
		
		for(int i = 0; i < sets.size(); ++i){
			System.out.println(sets.get(i)[0].toString() + " " + sets.get(i)[1].toString());
		}*/
		
		/*ArrayList<String> t = new ArrayList<String>();
		t.add("one");
		t.add("two");
		t.add("one");
		
		System.out.println(t.size());
		
		t.remove("two");
		
		System.out.println(t.size());*/
		
		/*int [][] array = new int[5][0];
		
		System.out.println(array.length);
		System.out.println(array[0].length);*/
	}

}
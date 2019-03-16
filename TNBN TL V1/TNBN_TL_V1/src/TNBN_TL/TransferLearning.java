/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lfiedlerc
 */

package TNBN_TL;

import elvira.Bnet;
import elvira.InvalidEditException;
import elvira.Link;
import elvira.LinkList;
import elvira.Node;
import elvira.NodeList;
import elvira.learning.Learning;

public class TransferLearning extends Learning {
    
    public void learning(){}
    
    @Override
    public LinkList[] compareOutput(Bnet b){

	LinkList addel[] = new LinkList[3];
	int i;
	LinkList linksbcopy,linksbapcopy,linksadd,linksdel,linkschange;
	Link link,linkbap,link2,linkbap2;
	Node nodeT,nodeH;
	elvira.Graph bcopy = (elvira.Graph) b.duplicate();
	bcopy.setKindOfGraph(2);
        elvira.Graph bapcopy = (elvira.Graph) getOutput().duplicate();
	bapcopy.setKindOfGraph(2);

	linksbcopy = bcopy.getLinkList();
        linksbapcopy = bapcopy.getLinkList();

	linksadd = new LinkList();
	linksdel = new LinkList();
	linkschange = new LinkList();

	for(i=0 ; i< linksbcopy.size(); i++)
           {
	    link = (Link) linksbcopy.elementAt(i);
	    nodeT =(Node)link.getTail();
	    nodeH =(Node)link.getHead();
	    linkbap = bapcopy.getLink(nodeT,nodeH);
	    linkbap2 = bapcopy.getLink(nodeH,nodeT);
	    if ((linkbap != null) || (linkbap2 != null)){
	       if (linkbap != null){ 
	          if (link.getDirected()){
                      
		     if (!linkbap.getDirected()){ linkschange.insertLink(link);
                     }else
		     {if (nodeH.equals(linkbap.getTail()) && nodeT.equals(linkbap.getHead()))
		          linkschange.insertLink(link);
		     }
                  }else
		  {if (linkbap.getDirected()) linkschange.insertLink(link);
		  }
            }else //linkbap2 is not null
	          if (link.getDirected())
		     if (!linkbap2.getDirected()) linkschange.insertLink(link);
	             else
		     {if (nodeH.equals(linkbap2.getTail()) && nodeT.equals(linkbap2.getHead()))
		          linkschange.insertLink(link);
		     } 
	          else
		  {if (linkbap2.getDirected()) linkschange.insertLink(link);
		  }
           } else {linksdel.insertLink(link);}
	   }

	for(i=0 ; i< linksbapcopy.size();i++)
	   {
	    linkbap = (Link) linksbapcopy.elementAt(i);
	    nodeT =(Node)linkbap.getTail();
	    nodeH =(Node)linkbap.getHead();
	    link = bcopy.getLink(nodeT,nodeH);
	    link2 = bcopy.getLink(nodeH,nodeT);
	    if ((link == null) && (link2 == null)){ linksadd.insertLink(linkbap);}
	   }

	addel[0]=linksadd;
	addel[1]=linksdel;
	addel[2]=linkschange;
	return addel;

   }//end compareOutput method

    
}

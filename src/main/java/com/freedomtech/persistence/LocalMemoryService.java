package com.freedomtech.persistence;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;

public class LocalMemoryService {

	public Map<String, Customer> customers;
	public Map<String, Category> categories;
	public Map<String, Type> types;
	public Map<String, Product> products;

	@Autowired
	public ApplicationContext appContext;

	public LocalMemoryService() {
		customers = new HashMap<String, Customer>();
		categories = new HashMap<String, Category>();
		types = new HashMap<String, Type>();
		products = new HashMap<String, Product>();

		// Categories
		Category blindess = new Category(
				"Blindness",
				"These products provide access to printed material, photographs or computer interfaces"
						+ " for individuals who are blind or visually impaired. Vision aids are available as "
						+ "lightweight, portable devices, sophisticated, stationary desktop devices or easy-to-use "
						+ "software programs.");

		Category lowVision = new Category(
				"Low Vision",
				"Vision aids provide access to printed material, photographs or"
						+ " computer interfaces for individuals living with low vision. Vision aids are available as lightweight,"
						+ " portable handheld magnifiers, sophisticated, stationary desktop devices or easy-to-use software programs.");

		Category learning = new Category(
				"Learning",
				"Educational assistive technology and curricula is designed to"
						+ " enhance the learning experience for students with cognitive challenges as well as meet the requirements"
						+ " of Individual Education Plans. Students with Dyslexia, Autism, ADD, ADHD, and more can benefit from "
						+ "learning disability products.");

		Category hearing = new Category(
				"Hearing",
				"Hearing assistive technologies make sound accessible for individuals with"
						+ " hearing challenges. Some devices may increase decibel levels, making sound audible for the hard of hearing."
						+ " Others will communicate sound via alternative methods, such as text or flashing light, for those who are deaf.");

		Category keyboardsMice = new Category(
				"Keyboards & Mice",
				"Alternative keyboards and mice provide computer access"
						+ " for those who lack the fine motor skills or visual capabilities to operate standard peripherals. From"
						+ " large format keyboards to touch pads and trackballs, each item is customized to suit the individual"
						+ " needs of the user.");

		Category mobility = new Category(
				"Mobility",
				"Mobility aids are assistive technologies designed to work in "
						+ "place of a keyboard or mouse to make computers accessible for individuals with physical limitations"
						+ " due to Cerebral Palsy, Parkinson’s Disease, paralysis, Muscular Dystrophy, Multiple Sclerosis, head"
						+ " injury or loss of a limb.");

		Category communication = new Category(
				"Communication",
				"Individuals with communication or speech challenges"
						+ " such as Cerebral Palsy, ALS or Autism use Alternative and Augmented Communication Aids to converse."
						+ " ACC devices range from simple picture cards that communicate a thought to sophisticated high tech"
						+ " electronic boards with interactive buttons that speak a prompted command.");

		Category switches = new Category(
				"Switches",
				"Switches are buttons used to access mobility devices, computer"
						+ " software programs, computer hardware, communication devices and environmental controls. Switches"
						+ " are available in a variety of shapes, sizes and colors and are designed to take advantage of any"
						+ " physical control regardless of mobility challenge.");

		Category ergonomics = new Category(
				"Ergonomics",
				"Ergonomic devices provide a workspace intended to prevent"
						+ " long term disability caused by repetitive strain injuries. Also suitable for individuals with"
						+ " mobility challenges, ergonomic keyboards, mice and workstations offer a range of functional"
						+ " designs that reduce fatigue and discomfort.");

		// Types
		Type brailleDisplays = new Type(
				"Braille Displays",
				"A refreshable Braille display or Braille terminal is an electro-mechanical device for displaying Braille"
						+ " characters, usually by means of raising dots through holes in a flat surface. Blind computer users,"
						+ " who cannot use a normal computer monitor, use it to read text output.",
				blindess);

		Type brailleEmbossers = new Type(
				"Braille Embossers",
				"Braille embossers, unlike ink printers, render text"
						+ " as Braille on uniquely thick paper or plastic. Used in conjunction with Braille translation software,"
						+ " embossers can print single-sided or double-sided Braille characters as well as Braille images.",
				blindess);

		Type brailleNoteTakers = new Type(
				"Braille Notetakers",
				"Braille Notetakers are personal digital assistants"
						+ " for individuals who are blind or visually impaired.  Input is through a Perkins-style Braille "
						+ "keyboard or a standard QWERTY keyboard.  Output is through an adjustable speech synthesizer and "
						+ "some models include refreshable braille displays which can also provide refreshable braille when "
						+ "connected to a computer running popular screen reading programs.",
				blindess);

		Type ocrScanning = new Type(
				"OCR Scanning",
				"Optical character recognition, usually abbreviated to OCR, is the mechanical or electronic translation"
						+ " of scanned images of handwritten, typewritten or printed text into machine-encoded text. OCR provides"
						+ " alternative access to printed materials by converting it to speech or other formats.",
				blindess);

		Type otherBlindnessProducts = new Type(
				"Other Blindness Products",
				"These products have been adapted or specially designed and developed for individuals with vision"
						+ " impairments. These items also incorporate technologies that assist in completing daily tasks "
						+ "and include large button phones, digital talking book players, color identifiers, and talking watches.",
				blindess);

		Type screenReaders = new Type(
				"Screen Readers",
				"Screen readers are computer software programs that read aloud the text displayed on a computer screen."
						+ " Screen readers may be used by individuals who are blind or have low vision to navigate the internet,"
						+ " compose a document and have access to written word.",
				blindess);

		Type readerDaisyPlayers = new Type(
				"Readers & DAISY Players",
				"DAISY Player and Book Readers make print material"
						+ " accessible to individuals who are blind, have low vision, learning disabilities or are illiterate."
						+ " Each allows users to hear and navigate written material presented in an audible format. Boundless"
						+ " offers top of the line DAISY Players and Book Readers from leading manufacturers like Humanware"
						+ " and Plextor.", blindess);

		// Products

		Product piafTactile = new Product(
				"Piaf Tactile",
				brailleEmbossers,
				"Piaf produces high quality tactile graphics"
						+ " using heat sensitive capsule paper.",
				"Piaf produces high quality tactile graphics using"
						+ " heat sensitive capsule paper. It is ideal for people who are blind and vision impaired."
						+ " Piaf's controlled heat source causes any black lines,letters or shapes that are drawn,"
						+ " printed or copied onto the capsule paper to swell. The result is an instant "
						+ "tactile graphic. Piaf is being used in a variety of educational, employment and personal"
						+ " settings.", "1395");

		Product romeoAttache = new Product(
				"Romeo Attache",
				brailleEmbossers,
				"The Romeo Attache brings legendary Braille quality to a portable device.",
				"The Romeo Attaché makes legendary Romeo Braille quality more portable than ever, and are perfect for"
						+ " on-the-go-teachers and students. It weighs only 16 pounds and is built into a sturdy metal case with"
						+ " the finest quality, environmentally friendly materials.",
				"2295");

		Product romeo = new Product(
				"Romeo",
				brailleEmbossers,
				"Bring legendary Braille quality in a rugged, portable single-sided Braille embosser.",
				"The Romeo 25 produces legendary Braille quality at 25 characters per second. It is the ideal solution"
						+ " for those who need a durable, single sided Braille Embosser that has the capabilities of producing"
						+ " up to a 40 character Braille line, without the need of a faster, more expensive, embosser.",
				"2495");

		Product juliet = new Product(
				"Juliet",
				brailleEmbossers,
				"Double-sided, wide-line embossers made in the USA for over 40 years.",
				"A double sided Braille Embosser has the capabilities of embossing Braille on the front and back"
						+ " of each sheet of paper. This reduces the amount of paper used to create a document by half,"
						+ " verses a single sided Braille Embosser. Double sided Braille reduces the number of pages and"
						+ " weight of the finished document for those who need to carry their work with them, such as students,"
						+ " and for those who ship their finished document, such as a small business.",
				"3995");

		Product basicD = new Product(
				"Basic-D",
				brailleEmbossers,
				"Basic-D is a stable companion, at home or in the office.",
				"Basic-D is a stable companion, at home or in the office. You can feed it a box of fan folded"
						+ " paper and it will emboss without interruption. Basic-D is a success story. The most sold"
						+ " braille embosser in the world is easy to use and easy to like, using fan folded paper to"
						+ " produce double sided braille. Now in Version 4 (V4) with even better stability.",
				"3095");

		Product everestD = new Product(
				"Everest-D",
				brailleEmbossers,
				"The Everest-D is a high volume professional"
						+ " embosser for magazines to braille business cards.",
				"Everest-D Braille Embosser is a high"
						+ " volume professional braille printer that embosses double sided Braille on copy paper."
						+ " It is a fully flexible embosser, ideal for magazines in normal or newspaper format,"
						+ " labels, braille business cards and Braille on plastic or thin metal.",
				"4195");

		Product brailleBox = new Product("Braille Box", brailleEmbossers,
				"A braille embosser that fits on your"
						+ " desktop without the disturbing noise.",
				"Braille Box embosses 800 pages of braille every hour,"
						+ " quietly and without taking up space.", "12995");

		// Customer
		Customer admin = new Customer("Antonello", "Fodde", "admin@admin.com",
				"password", "Italy", "Via Ajaccio 5", "Milano", "20133",
				new Cart());

		// Filling lists
		categories.put(blindess.name, blindess);
		categories.put(lowVision.name, lowVision);
		categories.put(learning.name, learning);
		categories.put(hearing.name, hearing);
		categories.put(keyboardsMice.name, keyboardsMice);
		categories.put(mobility.name, mobility);
		categories.put(communication.name, communication);
		categories.put(switches.name, switches);
		categories.put(switches.name, switches);
		categories.put(ergonomics.name, ergonomics);

		types.put(brailleDisplays.name, brailleDisplays);
		types.put(brailleEmbossers.name, brailleEmbossers);
		types.put(brailleNoteTakers.name, brailleNoteTakers);
		types.put(ocrScanning.name, ocrScanning);
		types.put(otherBlindnessProducts.name, otherBlindnessProducts);
		types.put(screenReaders.name, screenReaders);
		types.put(readerDaisyPlayers.name, readerDaisyPlayers);

		products.put(piafTactile.name, piafTactile);
		products.put(romeoAttache.name, romeoAttache);
		products.put(romeo.name, romeo);
		products.put(juliet.name, juliet);
		products.put(basicD.name, basicD);
		products.put(everestD.name, everestD);
		products.put(brailleBox.name, brailleBox);
		
		customers.put(admin.email, admin);

	}
}

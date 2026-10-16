/** Entirely fictional personnel files for Waylaid's carriers. */
export type CarrierProfile = {
  /** the carrier's actual name */
  name: string;
  nickname: string;
  age: string;
  hometown: string;
  origin: string;
  likes: string[];
  dislikes: string[];
  fears: string[];
  quote: string;
  funFact: string;
};

export const CARRIER_PROFILES: Record<string, CarrierProfile> = {
  snail: {
    name: 'Gary Shellington III',
    nickname: 'Turbo (ironically)',
    age: '4 years, which he insists is “young for a professional”',
    hometown: 'Under a damp flowerpot in Kokomo, Indiana',
    origin:
      'Gary was napping on an envelope when someone mailed it. Eleven months later he arrived in Ohio, was handed a tip, and decided this was clearly his calling.',
    likes: ['Wet sidewalks', 'Lettuce, specifically the crunchy bit', 'Taking the scenic route (it is all scenic at 0.03 mph)'],
    dislikes: ['Salt', 'Being asked “are we there yet”', 'Gravel driveways'],
    fears: ['Thrushes', 'Toddlers with buckets', 'The concept of “express delivery”'],
    quote: '“Your letter is not late. Your expectations are early.”',
    funFact: 'Holds the Waylaid record for longest delivery: 2 years, 41 days, and one complete change of shell.',
  },
  moth: {
    name: 'Lumière Dustwing',
    nickname: 'The Messenger of Last Resort',
    age: 'About two weeks, but an extremely dramatic two weeks',
    hometown: 'A tower in the hills, or possibly your garage',
    origin:
      'Lumière once carried an urgent plea from a wizard on a tower to some very large eagles. It went great. She has been trying to recreate that success ever since, with mixed results (mostly mixed with porch lights).',
    likes: ['Whispered messages', 'Moonlight', 'Your favourite wool sweater'],
    dislikes: ['Being called a butterfly', 'Bats', 'Daytime in general'],
    fears: ['Porch lights (she cannot resist them, and she knows it)', 'Mothballs', 'Being upstaged by eagles again'],
    quote: '“I will find the eagles. I just need to check this one lamp first.”',
    funFact: 'Only about 1 in 6 of her deliveries arrive. She describes the other 5 as “artistic choices.”',
  },
  walk: {
    name: 'Doug Footman',
    nickname: 'Doug',
    age: '52',
    hometown: 'Halfway between wherever you are and wherever you want to be',
    origin:
      'Doug went out for a short walk in 1997 and simply never stopped. People started handing him letters because he was “going that way anyway.”',
    likes: ['Comfortable socks', 'Diners with good pie', 'Pointing at birds'],
    dislikes: ['Blisters', 'Escalators that are “out of order” (“they are stairs, Karen”)', 'Hills, though he would never say so'],
    fears: ['Untied shoelaces', 'Albuquerque, where he has taken a wrong turn four times'],
    quote: '“I could take a bus. I could. I won’t, but I could.”',
    funFact: 'Has walked roughly 140,000 miles. Has been offered a ride roughly 140,000 times.',
  },
  horse: {
    name: 'Biscuit',
    nickname: 'The Pony Express (singular)',
    age: '11',
    hometown: 'St. Joseph, Missouri, as he will remind you',
    origin:
      'Biscuit is a direct descendant of a real Pony Express horse, or so the pamphlet says. He came out of retirement because “kids these days don’t write letters by horse anymore.”',
    likes: ['Apples', 'Wide open plains', 'A dramatic gallop toward the sunset'],
    dislikes: ['Plastic bags (they are always plotting something)', 'Cattle guards', 'Being called “a medium dog”'],
    fears: ['Plastic bags', 'Bandits', 'Plastic bags operated by bandits'],
    quote: '“Neigh.” (Translated: “Hold onto your hat.”)',
    funFact: 'Has thrown 3 riders, 2 mail sacks, and 1 surprisingly heavy fruitcake.',
  },
  bicycle: {
    name: 'Skye Spokes',
    nickname: 'Fixie',
    age: '26',
    hometown: 'Downtown, at every red light at once',
    origin:
      'Skye was a bike messenger in the city until someone tried to send a letter by email. Out of spite, Skye now delivers letters across entire states.',
    likes: ['Green lights', 'Kombucha', 'Saying “on your left”'],
    dislikes: ['Car doors', 'Hills', 'People who say “e-bikes count”'],
    fears: ['Flat tires without a patch kit', 'Opening car doors', 'Long-distance hills (again)'],
    quote: '“I don’t brake for anything except chain-related emergencies.”',
    funFact: 'Owns 14 bikes. Rides one. Talks about the other 13 constantly.',
  },
  balloon: {
    name: 'Professor Barnaby Gust',
    nickname: 'Windy',
    age: '73',
    hometown: 'Approximately 3,000 feet above Albuquerque',
    origin:
      'Professor Gust set out to circle the globe by balloon in 1981 and is still technically attempting it. He delivers letters “when the wind is going that way,” which is a surprisingly flexible definition.',
    likes: ['Tailwinds', 'Picnics at altitude', 'Waving at people who do not wave back'],
    dislikes: ['Headwinds', 'Power lines', 'Birds who think his balloon is “a challenge”'],
    fears: ['Thunderstorms', 'Running out of propane over a lake', 'Power lines (he has met several)'],
    quote: '“Wherever the wind blows! Within reason. Not into that storm. Oh dear.”',
    funFact: 'Has never once landed where he intended. Calls this “a feature.”',
  },
  train: {
    name: 'Engine No. 9 “Old Puffington”',
    nickname: 'Puff',
    age: '128, lovingly restored',
    hometown: 'A roundhouse in Fort Wayne, Indiana',
    origin:
      'Puffington hauled mail across the Midwest for decades until he was replaced by trucks. He has been quietly furious about it since 1956 and is determined to prove trains are still the best way to send anything.',
    likes: ['Schedules', 'Whistling at crossings', 'The smell of coal in the morning'],
    dislikes: ['Trucks', 'Cows standing on the tracks “just to make a point”', 'Being called a “choo-choo”'],
    fears: ['Cows', 'Missing a junction', 'Being turned into a museum exhibit'],
    quote: '“All aboard! Not you, cow.”',
    funFact: 'Has delivered over a million letters and lost one mailbag, which he still refuses to discuss.',
  },
  pigeon: {
    name: 'Reginald “Reg” Featherstone',
    nickname: 'Old Reliable (98% of the time)',
    age: '6',
    hometown: 'A statue in a city park (he won’t say which statue)',
    origin:
      'Reg comes from a long line of distinguished carrier pigeons. His great-great-grandmother carried messages in wartime. Reg mostly carries invitations to brunch, but he takes it every bit as seriously.',
    likes: ['Bread crumbs', 'Statues', 'Strutting in circles for no reason'],
    dislikes: ['Hawks', 'Windows (“they are lying to you”)', 'Being called a “rat with wings”'],
    fears: ['Hawks', 'Very clean windows', 'Accidentally joining a different flock and liking it more'],
    quote: '“Coo. I mean: your letter is in excellent hands. Wings.”',
    funFact: 'The classic. Gets there about 98 times out of 100, and the other 2 involve a hawk.',
  },
  car: {
    name: 'Brenda',
    nickname: 'The Minivan',
    age: '2009 model, 214,000 miles',
    hometown: 'A suburban driveway with a basketball hoop',
    origin:
      'Brenda spent 15 years doing school runs. When the kids left for college she found herself with a lot of free time and an empty passenger seat, and took up mail delivery for “a sense of purpose.”',
    likes: ['Road trips', 'Drive-thru windows', 'The same three songs on repeat'],
    dislikes: ['Tractors in the left lane', 'Potholes', 'The check-engine light (she says it is “just being dramatic”)'],
    fears: ['Running out of gas', 'Open windows on the interstate', 'The car wash, for some reason'],
    quote: '“We’ll stop when we get there. Hold it.”',
    funFact: 'Fails about once every 100,000 trips, usually because someone rolled the window down.',
  },
  jet: {
    name: 'Captain Hank Highwater',
    nickname: 'Cap',
    age: 'Classified as “seasoned”',
    hometown: 'Gate B22, somewhere with a long layover',
    origin:
      'Captain Highwater flies an airmail jet full of letters, packages, and, inexplicably, one live goat. He took up mail flying because, unlike passengers, envelopes never ask if the flight is going to be on time.',
    likes: ['Smooth air', 'Tiny pretzels', 'Announcing the altitude unprompted'],
    dislikes: ['Turbulence', 'Being rerouted through Newark', 'The goat (they have history)'],
    fears: ['Lost baggage', 'Newark', 'The cargo hold door that “usually” closes properly'],
    quote: '“Folks, we’re cruising at 35,000 feet. Your letter is in the overhead bin. Probably.”',
    funFact: 'Your letter has a 1 in 2,000 chance of ending up in Newark forever.',
  },
  sr71: {
    name: 'Major “Lightning” Lex Mach',
    nickname: 'The Blackbird',
    age: 'Classified',
    hometown: 'Classified',
    origin:
      'Lex flew reconnaissance at Mach 3.3 until the program was “retired.” Nobody knows how a retired spy plane ended up carrying birthday cards. Lex says it is better that way.',
    likes: ['Going very, very fast', 'Outrunning things', 'Sunglasses at night'],
    dislikes: ['Speed limits', 'Being asked to “just slow down a bit”', 'Paperwork'],
    fears: ['Fuel leaks (it always leaks)', 'Cornfields (long story)', 'Being reassigned to crop dusting'],
    quote: '“Your letter arrived before you finished writing it. Don’t ask how.”',
    funFact: 'Leaks fuel on the runway by design: the panels only seal once they heat up at Mach 3. This is real.',
  },
};

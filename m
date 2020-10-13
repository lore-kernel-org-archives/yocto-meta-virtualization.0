Received: from 15.mo6.mail-out.ovh.net (15.mo6.mail-out.ovh.net [188.165.39.161])
 by mx.groups.io with SMTP id smtpd.web10.7745.1602580408165559877
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 13 Oct 2020 02:13:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=softfail (domain: 3mdeb.com, ip: 188.165.39.161, mailfrom: maciej.pijanowski@3mdeb.com)
Received: from player714.ha.ovh.net (unknown [10.108.35.59])
	by mo6.mail-out.ovh.net (Postfix) with ESMTP id 6AF1622CA42
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Oct 2020 11:13:25 +0200 (CEST)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: maciej.pijanowski@3mdeb.com)
	by player714.ha.ovh.net (Postfix) with ESMTPSA id 9E21B170769E9
	for <meta-virtualization@lists.yoctoproject.org>; Tue, 13 Oct 2020 09:13:24 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-96R001c1b81268-6702-48e5-b319-c3f085e08d51,
                    0E1057F6502E6341CA3264AA444900C541C0491A) smtp.auth=maciej.pijanowski@3mdeb.com
To: meta-virtualization@lists.yoctoproject.org
From: "Maciej Pijanowski" <maciej.pijanowski@3mdeb.com>
Subject: balena Engine recipe
Message-ID: <819670c7-f09b-0407-9529-ae9bf5416c3e@3mdeb.com>
Date: Tue, 13 Oct 2020 11:13:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
X-Ovh-Tracer-Id: 8049058434766941873
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrheelgddufecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepvffhuffkffgfgggtgfesthejredttdefjeenucfhrhhomhepofgrtghivghjucfrihhjrghnohifshhkihcuoehmrggtihgvjhdrphhijhgrnhhofihskhhiseefmhguvggsrdgtohhmqeenucggtffrrghtthgvrhhnpeeuteeufeejjeeigeffkeffhedtkedtieekgfehvdetvdekkedttdeiteekheegkeenucffohhmrghinhepghhithhhuhgsrdgtohhmpdgsrghlvghnrgdrihhopdefmhguvggsrdgtohhmnecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudegrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepmhgrtghivghjrdhpihhjrghnohifshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehmvghtrgdqvhhirhhtuhgrlhhiiigrthhiohhnsehlihhsthhsrdihohgtthhophhrohhjvggtthdrohhrgh
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

I have created a recipe [1] for the balena Engine [2].
It is mostly based on the original recipe from meta balena [3].
But the original recipe was tied to the balenaOS. I have removed the
balenaOS specific parts and moved the recipe to the separate layer,
which was also suggested by the balenaOS devs. Now I'm wondering
whether it would make sense to include the recipe into the 
meta-virtualization
layer. Any opinions on that?

[1] 
https://github.com/3mdeb/meta-balena-engine/tree/master/recipes-containers/balena-engine
[2] https://www.balena.io/engine/
[3] 
https://github.com/balena-os/meta-balena/blob/master/meta-balena-common/recipes-containers/balena/balena_git.bb
[4] https://forums.balena.io/t/balenaengine-yocto-layer/48311/2

-- 
Maciej Pijanowski
Embedded Systems Engineer
GPG: 9963C36AAC3B2B46
https://3mdeb.com | @3mdeb_com


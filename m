Return-Path: <norbert.kaminski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 799D4E00DF8; Sun, 17 Nov 2019 23:01:28 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=5.0 tests=BAYES_00,MISSING_HEADERS,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [46.105.36.172 listed in list.dnswl.org]
	*  1.0 MISSING_HEADERS Missing To: header
X-Greylist: delayed 600 seconds by postgrey-1.32 at yocto-www;
	Sun, 17 Nov 2019 23:01:27 PST
Received: from 3.mo177.mail-out.ovh.net (3.mo177.mail-out.ovh.net
	[46.105.36.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5F22DE00E04
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Nov 2019 23:01:27 -0800 (PST)
Received: from player770.ha.ovh.net (unknown [10.108.35.210])
	by mo177.mail-out.ovh.net (Postfix) with ESMTP id 243A6112A28
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Nov 2019 07:45:46 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player770.ha.ovh.net (Postfix) with ESMTPSA id 277A7C36DEC1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Nov 2019 06:45:45 +0000 (UTC)
References: <30d8618a-fe76-b5a5-3ac8-e3a34423a72a@3mdeb.com>
Cc: meta-virtualization@yoctoproject.org
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
X-Forwarded-Message-Id: <30d8618a-fe76-b5a5-3ac8-e3a34423a72a@3mdeb.com>
Message-ID: <d65dd235-8e95-781a-3ee6-f2906f1b8403@3mdeb.com>
Date: Mon, 18 Nov 2019 07:45:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <30d8618a-fe76-b5a5-3ac8-e3a34423a72a@3mdeb.com>
X-Ovh-Tracer-Id: 4474607705300506900
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 30
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeggedguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjqdffgfeufgfipdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecumhhishhsihhnghcuvffquchfihgvlhguucdlfedtmdenucfjughrpefufhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheppfhorhgsvghrthcumfgrmhhinhhskhhiuceonhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejtddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehmvghtrgdqvhhirhhtuhgrlhhiiigrthhiohhnseihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedt
Subject: Re: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 18 Nov 2019 07:01:28 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 18.11.2019 06:39, Christopher Clark wrote:
> On Sun, Nov 17, 2019 at 7:37 PM Bruce Ashfield 
> <bruce.ashfield@gmail.com> wrote:
>> On Thu, Nov 14, 2019 at 9:24 AM Norbert Kaminski
>> <norbert.kaminski@3mdeb.com> wrote:
>>> From ea86f97c347f6637d85a6fdbf36943d43adfa18e Mon Sep 17 00:00:00 2001
>>> From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
>>> Date: Tue, 12 Nov 2019 11:25:29 +0100
>>> Subject: [PATCH] recipes-extended/xen/xen.inc: Add RDEPENDS_${PN}-pygrub
>> Maybe: "xen: fix pygrub runtime by adding xen-python to xen-pygrub
>> RDEPENDS" as the shortlog ?
>>
>>> The patch fixes a problem with importing the package xen.lowlevel.xc.
>>> RDEPENDS add the xen-python tool, which contains the package.
>> Can we expand on this message a bit ?
>>
>> I assume that something from xen.lowlevel.xc is pulling in pygrub, and
>> that in turn requires xen-python? What is the actual on-target or boot
>> issue this then triggers ?
>>
>> I'm not currently able to do Xen runtime tests (and hence can't see
>> this for myself), so I'm trying to understand the issue just from the
>> commit message (and failing at the moment).
> One issue that Norbert's patch fixes is: when xen-pygrub is added to
> an image, it doesn't pull in the xen-python package that it needs
> which contains the support
> library xen.lowlevel.xc .
That issue happened to me, while I was building an ipfire vm guest.
The image is splited into three parts and therefore needs a pygrub to 
work as a vm.
Pygrub imports the xen.lowlevel.xc, which is included in the xen-python 
package.
Therefore I'm adding a xen-python in the patch.

Norbert

> I've build-tested a similar patch in a related environment and I think
> the patch should also have this too:
>
> +RDEPENDS_${PN}-python = " \
> + python \
> + "
>
> Christopher
>
>
>
>> Cheers,
>>
>> Bruce
>>
>>> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
>>> ---
>>> recipes-extended/xen/xen.inc | 2 ++
>>> 1 file changed, 2 insertions(+)
>>>
>>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>>> index 628e52b..ba00d2a 100644
>>> --- a/recipes-extended/xen/xen.inc
>>> +++ b/recipes-extended/xen/xen.inc
>>> @@ -151,6 +151,8 @@ RDEPENDS_${PN}-xentrace = "python"
>>>
>>> RDEPENDS_${PN}-xen-watchdog = "bash"
>>>
>>> +RDEPENDS_${PN}-pygrub = "${PN}-python"
>>> +
>>> PACKAGES = "\
>>> ${PN}-base \
>>> ${PN}-blktap \
>>> --
>>> 2.17.1
>>>
>>> --
>>> _______________________________________________
>>> meta-virtualization mailing list
>>> meta-virtualization@yoctoproject.org
>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>> --
>> - Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end
>> - "Use the force Harry" - Gandalf, Star Trek II
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


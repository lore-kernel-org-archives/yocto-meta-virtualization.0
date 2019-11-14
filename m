Return-Path: <norbert.kaminski@3mdeb.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 81926E00E3B; Thu, 14 Nov 2019 07:01:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [46.105.56.76 listed in list.dnswl.org]
Received: from 6.mo179.mail-out.ovh.net (6.mo179.mail-out.ovh.net
	[46.105.56.76])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7FEE5E00DF1
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 07:01:09 -0800 (PST)
Received: from player795.ha.ovh.net (unknown [10.109.160.62])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 3424D14B0DC
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Nov 2019 15:22:49 +0100 (CET)
Received: from 3mdeb.com (85-222-117-222.dynamic.chello.pl [85.222.117.222])
	(Authenticated sender: norbert.kaminski@3mdeb.com)
	by player795.ha.ovh.net (Postfix) with ESMTPSA id 8C85DBEBCA62;
	Thu, 14 Nov 2019 14:22:45 +0000 (UTC)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	meta-virtualization@yoctoproject.org
References: <c03f4a40-ed57-76a8-49f8-85e25738a69a@3mdeb.com>
	<CADkTA4PPaE3ijWo7-36-vhKepUwDH2YovZw3Ad9F3N2phiYcdg@mail.gmail.com>
From: Norbert Kaminski <norbert.kaminski@3mdeb.com>
Message-ID: <56a4bd12-583c-1228-7179-e2bbaa4d4b12@3mdeb.com>
Date: Thu, 14 Nov 2019 15:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PPaE3ijWo7-36-vhKepUwDH2YovZw3Ad9F3N2phiYcdg@mail.gmail.com>
X-Ovh-Tracer-Id: 7149745885634927052
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrudeffedgieegucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdqfffguegfifdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfesthejredttdefjeenucfhrhhomheppfhorhgsvghrthcumfgrmhhinhhskhhiuceonhhorhgsvghrthdrkhgrmhhinhhskhhiseefmhguvggsrdgtohhmqeenucffohhmrghinhephihotghtohhprhhojhgvtghtrdhorhhgnecukfhppedtrddtrddtrddtpdekhedrvddvvddruddujedrvddvvdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeelhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehnohhrsggvrhhtrdhkrghmihhnshhkihesfehmuggvsgdrtghomhdprhgtphhtthhopehmvghtrgdqvhhirhhtuhgrlhhiiigrthhiohhnseihohgtthhophhrohhjvggtthdrohhrghenucevlhhushhtvghrufhiiigvpedt
Cc: piotr.krol@3mdeb.com
Subject: Re: recipes-extended/images/xen-image-minimal.bb: change, hardcoded vmlinuz to the KERNEL_IMAGETYPE variable
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
X-List-Received-Date: Thu, 14 Nov 2019 15:01:11 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US


On 31.10.2019 23:09, Bruce Ashfield wrote:
> On Thu, Oct 31, 2019 at 2:23 PM Norbert Kaminski
> <norbert.kaminski@3mdeb.com> wrote:
>> Why is vmlinuz hard-coded in the syslinux.cfg? Could it be replaced by
>> the KERNEL_IMAGETYPE?
>>
> I'm guessing it just hasn't been something that others have wanted to configure.
>
> The patch looks ok to me. I assume those that are currently relying on
> /vmlinuz will have that already as their kernel build type (since it
> is being built).
>
> I'll wait a few days to see if anyone objects.

So far, there have been no objections, thus I think it could be merged.

Norbert

> Bruce
>
>
>>   From 450becb15192a3541b7a3d55ace75a1929d15add Mon Sep 17 00:00:00 2001
>> From: Asiderr <norbert.kaminski@3mdeb.com>
>> Date: Thu, 31 Oct 2019 17:50:53 +0100
>> Subject: [PATCH] recipes-extended/images/xen-image-minimal.bb: change
>> hardcoded vmlinuz to the variable
>>
>> Signed-off-by: Norbert Kaminski <norbert.kaminski@3mdeb.com>
>> ---
>>    recipes-extended/images/xen-image-minimal.bb | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/images/xen-image-minimal.bb
>> b/recipes-extended/images/xen-image-minimal.bb
>> index c39d378..740ef1f 100644
>> --- a/recipes-extended/images/xen-image-minimal.bb
>> +++ b/recipes-extended/images/xen-image-minimal.bb
>> @@ -61,6 +61,6 @@ build_syslinux_cfg () {
>>        echo "PROMPT 1" >> ${SYSLINUX_CFG}
>>        echo "LABEL boot" >> ${SYSLINUX_CFG}
>>        echo "  KERNEL mboot.c32" >> ${SYSLINUX_CFG}
>> -    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} --- /vmlinuz
>> ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
>> +    echo "  APPEND /xen.gz ${SYSLINUX_XEN_ARGS} ---
>> /${KERNEL_IMAGETYPE} ${SYSLINUX_KERNEL_ARGS} --- /initrd" >> ${SYSLINUX_CFG}
>>    }
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>


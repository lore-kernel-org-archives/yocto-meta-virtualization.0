Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-lb0-f169.google.com (mail-lb0-f169.google.com
	[209.85.217.169])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9558E002AB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:11:57 -0800 (PST)
Received: by mail-lb0-f169.google.com with SMTP id m4so790340lbo.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 29 Jan 2013 06:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:user-agent:mime-version:to:cc
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=lMYcN6F5btbiR0yWDoH9yzF011O39c307uIv+Q8uHCI=;
	b=A8o9Yqlgu5uJL5/L7NOxcc4sdNI5f4+eEmTc8inVRYPmuhtQwSHvqArH9QENZbPcRt
	bD6dPqXVLYEjVlIiYxenpJhngn69AzDmfxvg1E8SoSsgbZI4wx1l61qTmDhk3TxJNaJ7
	V5LL6AY+Cw3s6QYRK7Kci++vvrOoPQciLOINpoRcwwdfDh1jTs+6iPmhfbsYM3t9GbFl
	9Lz/j6DCwTAd7JvQ99ltdTmKomExQ94HT7x2rwt3yx6F4eWFQq0MmHFFFYqGjQSGOTZ2
	VA/Zj2axkGj9duk2T0uIeeqvtcCA0qL6bTxpdzC4fPAYVUOQVkyHA6YArvQbpWs3Ea1Y
	wAuQ==
X-Received: by 10.152.144.202 with SMTP id so10mr1266086lab.9.1359468716457;
	Tue, 29 Jan 2013 06:11:56 -0800 (PST)
Received: from [172.16.140.31] (sestofw01.enea.se. [192.36.1.252])
	by mx.google.com with ESMTPS id td1sm5085339lab.17.2013.01.29.06.11.54
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 29 Jan 2013 06:11:55 -0800 (PST)
Message-ID: <5107D8A6.6090900@gmail.com>
Date: Tue, 29 Jan 2013 15:11:50 +0100
From: =?UTF-8?B?RGF2aWQgTnlzdHLDtm0=?= <david.c.nystrom@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1359464500-16993-1-git-send-email-mihai.prica@intel.com>
	<1359464500-16993-2-git-send-email-mihai.prica@intel.com>
	<5107D0DF.6040006@gmail.com>
	<CADkTA4OsbnmQCZ+2wkPjY6hoq-ZHE4PSt1ozYgsb=9Ur0Fcfqg@mail.gmail.com>
In-Reply-To: <CADkTA4OsbnmQCZ+2wkPjY6hoq-ZHE4PSt1ozYgsb=9Ur0Fcfqg@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] qemu: Enabled VGA output
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
X-List-Received-Date: Tue, 29 Jan 2013 14:11:58 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue 29 Jan 2013 02:54:49 PM CET, Bruce Ashfield wrote:
> On Tue, Jan 29, 2013 at 8:38 AM, David Nyström <david.c.nystrom@gmail.com>wrote:
>
>> On 01/29/2013 02:01 PM, Mihai Prica wrote:
>>
>>> Signed-off-by: Mihai Prica <mihai.prica@intel.com>
>>> ---
>>>    recipes-devtools/qemu/qemu_1.**3.0.bbappend |    3 +++
>>>    1 file changed, 3 insertions(+)
>>>    create mode 100644 recipes-devtools/qemu/qemu_1.**3.0.bbappend
>>>
>>> diff --git a/recipes-devtools/qemu/qemu_**1.3.0.bbappend
>>> b/recipes-devtools/qemu/qemu_**1.3.0.bbappend
>>> new file mode 100644
>>> index 0000000..2106825
>>> --- /dev/null
>>> +++ b/recipes-devtools/qemu/qemu_**1.3.0.bbappend
>>> @@ -0,0 +1,3 @@
>>> +# Enables QEMU to display the VGA output
>>> +DEPENDS_append = " libsdl"
>>> +SDL = "--enable-sdl"
>>>
>>>
>> Should this really be in meta-virt, this seems a bit distro specific ?
>>
>
> Can PACKAGECONFIG or a DISTRO_FEATURES help here ? SDL for qemu is
> probably a bad example, but keeping everything that we think is important
> for
> out of box experience, or proper operation, contained within a layer is a
> good
> thing .. but leaving it conditional on a distro setting for those that
> really don't
> want it, seems to strike the right balance.
>
> Cheers,
>
> Bruce

Agree, but even in this case, this is something for oe-core to 
facilitate in the qemu recipe.
Don't get me wrong, I'm not militant about anything, but I would rather 
like to avoid bbappends when possible,
if oe-core won't accept a PACKAGECONFIG enabling sdl, then lets the 
merge it here.

Br,
David


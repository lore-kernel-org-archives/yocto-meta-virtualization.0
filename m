Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 21CB9E00519; Sun, 25 Dec 2016 10:16:56 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5539BE0050B
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:16:54 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id a10so19666088ywa.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 25 Dec 2016 10:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=+J23bK8jNnO805HMbVTfzkNOVTlx4P8k815McqKXUcQ=;
	b=LPNoVRTr9jcu6anIdPpwZnQSP1e6OkUpQWnY7HLmFoacSB69dF6euO34J9aBohrU9G
	2EOGAOvb8TCrv/gGOiRGXRmb320b6OeWY8H2bmK6v0eDbosvUlyb2gSA2pgNxuZPjbsb
	RY2iy/UZ7koeWqCxG23I/7t5DNmsU7qeN01RNsuLksfZmzkAd/eAnfD68bhKjFzS2+d/
	pCEg8Z9ewcCMyS/sPhE3hoffctsAzM3j8tb1gsAz1U8274DvSLScq8iqUiOlPCXW2H92
	JWkDXoAOby97ksuR7JECPOYRJcNCpr0d/7uLBPK+Kzr86H7s51DUqlpsri/tePLJ00f9
	5ibg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=+J23bK8jNnO805HMbVTfzkNOVTlx4P8k815McqKXUcQ=;
	b=i3viO7ucAzctjxrcEzdWAzMmRGB8mzkZ7UCEd80L4lzuIAEMnw8E/4AXmTaDN888GD
	AaVdOkl19rym0HDrRP1MRuDA9uqdJcrg0ys4VWbekLeovr64fBVtg8w6IIKncyc+f2M9
	auY7EwplXdxGSIuNYj0O0oo4Y9/FRnRXjfTw3eADUfUbx7Px1EPXe9rwWpaZpYBlzZ6y
	FDS2aYkUcR/y9G9B5TGnN8K1Xl6OAEfVl96GcmRgvnQuT1xwICX+04HbB8izs99Gxpw8
	OGKVMapAqnfM7ZUzijJ9puJ18FfMJSWBmdTaDHXTqJC7Ru+1UtgRHnTxTtS6o8w1hvBT
	+UFw==
X-Gm-Message-State: AIkVDXJ4ZVLuunBwWYkAZ9TH9SSDuEkbwyR0/fZ3eX09JIHOhMxuHJDycPZo6hudDmhpL2eNaEwiUWCa5EICsg==
X-Received: by 10.13.224.129 with SMTP id j123mr14852503ywe.181.1482689813921; 
	Sun, 25 Dec 2016 10:16:53 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.171.82 with HTTP; Sun, 25 Dec 2016 10:16:53 -0800 (PST)
In-Reply-To: <CAPuovELsykZqBXJ1tYz-w6tJjtqi+0w8HLcFXxS8P4zFj-rXvg@mail.gmail.com>
References: <1401414421-25902-1-git-send-email-akuster@mvista.com>
	<CAPuovELsykZqBXJ1tYz-w6tJjtqi+0w8HLcFXxS8P4zFj-rXvg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Sun, 25 Dec 2016 13:16:53 -0500
X-Google-Sender-Auth: owUHGwj8fOV0-jamyg68PFh-az4
Message-ID: <CAPuovE+xJZcTBNjES0ijs1DZmG-ButLbs0ub+Qeoxopa-eLBDQ@mail.gmail.com>
To: Armin Kuster <akuster@mvista.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, akuster808@gmail.com
Subject: Re: [PATCH] python-barbican fix fetch error.
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 25 Dec 2016 18:16:56 -0000
Content-Type: text/plain; charset=UTF-8

Please ignore my previous message. I see gmail decided to pull a
number on me and move old email from 2014 to the top of my
meta-virtualization folder.

Mark

On Sun, Dec 25, 2016 at 1:05 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Be sure to include [mcs] in your subject to ensure Bruce doesn't have
> to search to determine which repo to apply the change to.
>
>
> On Thu, May 29, 2014 at 9:47 PM, Armin Kuster <akuster@mvista.com> wrote:
>> It appears the that git repo has moved. This is causing a do_fetch error.
>>
>> Signed-off-by: Armin Kuster <akuster@mvista.com>
>> ---
>>  meta-openstack/recipes-devtools/python/python-barbican_git.bb | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-openstack/recipes-devtools/python/python-barbican_git.bb b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
>> index bc12fcd..8ae0b21 100644
>> --- a/meta-openstack/recipes-devtools/python/python-barbican_git.bb
>> +++ b/meta-openstack/recipes-devtools/python/python-barbican_git.bb
>> @@ -4,10 +4,10 @@ SECTION = "devel/python"
>>  LICENSE = "Apache-2.0"
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=fc8be9e7dffe97390d1216b01fd0be01"
>>
>> -PR = "r0"
>> +PR = "r1"
>
> You can drop the PR, since the advent of the PR server assigning a PR
> number is not necessary and is actually unwanted.
>
>
>>  SRCNAME = "barbican"
>>
>> -SRC_URI = "git://github.com/stackforge/barbican.git;branch=master \
>> +SRC_URI = "git://github.com/cloudkeep/barbican.git;branch=master \
>>             file://barbican.init \
>>            "
>>
>
> This is step backwards as this repo even declares:
> Barbican moved to openstack/barbican. https://github.com/openstack/barbican
>
> Additionally the current recipe doesn't use 'branch=master' so this
> patch will not apply, do you have local changes?
>
> I am in the process of resurrecting meta-cloud-services so you might
> get this fetching issue fixed for free in the coming days if you want
> to wait for me, otherwise feel free to send out a V2 with the above
> corrected.
>
> Mark
>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization


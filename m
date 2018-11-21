Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B9210E00C74; Wed, 21 Nov 2018 09:56:36 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.219.178 listed in list.dnswl.org]
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
	[209.85.219.178])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DA7D9E00C10
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 09:56:35 -0800 (PST)
Received: by mail-yb1-f178.google.com with SMTP id i78-v6so2566827ybg.0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 21 Nov 2018 09:56:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
	:from:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=C8sSvPV6VQb3XgzrDbqw/gQMbvhEvCLYv/a37VuWxG8=;
	b=mE7PP8iuMWm8/FmWjzOPCHPbQvtNCTkdE8ddHIZ4fQWdYDV5goTJZHvCv6vLz4dV0M
	0NHe4IkMN/OY85rjMGEJWCPZwCSAh9DlPvHSsCaoImq2PJPHWoboPVCUMX3KHErY0033
	5WlEFOrXjSTpBhtUTB5ACOcWsdIOoMvuEyM9IEuPj5doynlRQZAlWX6d1FkJ+peuEgh3
	1+ObdoFkiF8OmrgriGWWd9sixClraUB5uk/niPF2dav9xQ5kQhrf2BvR3XDV+8TZFIi8
	hESnwkuQV5a+aGWoNL+ddwuTjYvYn917HT916C4vsqDpmSvAJ42yhX4V1jIPs9togB+a
	nBwQ==
X-Gm-Message-State: AA+aEWbNRkVdoPK8FRDSvRnPP2jp5z9WZ7Pmxzqcyh0RB1LMI1Bh0Vje
	wrsW+m9SlhTFUWpw8X+j6n8sfBHCLUP2PTldLyRS3GHv
X-Google-Smtp-Source: AFSGD/WL5TxBZGIUMIQHWg28mfypliZOkdP7hOYQHvj35/GqDcHVlTQwdrb2w72C1JBkCUbIUtGnPA5YN9AAC7R7dEw=
X-Received: by 2002:a25:c801:: with SMTP id
	y1-v6mr7363831ybf.183.1542822994731; 
	Wed, 21 Nov 2018 09:56:34 -0800 (PST)
MIME-Version: 1.0
References: <CABOWBEftJQEUAkdHwcSKUq6ZEcOq9zJFNh5C0riFLHrbc4-UBw@mail.gmail.com>
	<CAPuovEKG9j0eYyY7tA=2S==vH_RmkjN1MTPLfNVMt_0sOY0S=Q@mail.gmail.com>
	<CABOWBEcuj_vcBZC1OWbyZ-NHvO0Jj85hur1YdNK+zN5yV3xOnQ@mail.gmail.com>
In-Reply-To: <CABOWBEcuj_vcBZC1OWbyZ-NHvO0Jj85hur1YdNK+zN5yV3xOnQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Wed, 21 Nov 2018 12:56:23 -0500
Message-ID: <CAPuovEJssvZu4u+dWcVu9R-5cvU=1Ee7h8OwrMHA9xRNc9bgYg@mail.gmail.com>
To: hackdef@hack-defender.mx
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Request to backport libvmi to krogoth
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
X-List-Received-Date: Wed, 21 Nov 2018 17:56:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 21, 2018 at 12:16 PM HackDef <hackdef@hack-defender.mx> wrote:
>
> Thanks Mark for the great recommendation.
> Something that I tried so far and worked was to remove the libvirt depend=
ency in the libvmi recipe (since it is not needed by xen).
>
> But your recommendation is great for other cases that wont be fixed by a =
simple dependency removal.
>
> Will check it out. Thanks.

To be honest I would have to go look at the origin of the 'libxl'
dependency, I don't believe there is a recipe for this or any recipe
which provides this in the 'master' branch of any of the main Yocto
repos. At least nothing that is found in the index
(https://layers.openembedded.org/layerindex/branch/master/recipes/).

At any rate at this point you should be able to follow up to the list
to ask Bruce to cherry pick the libvmi commit to krogoth.

Mark


>
> On Wed, Nov 21, 2018 at 6:40 AM Mark Asselstine <mark.asselstine@windrive=
r.com> wrote:
>>
>> On Sat, Nov 17, 2018 at 4:29 AM HackDef <hackdef@hack-defender.mx> wrote=
:
>> >
>> > Recently libvmi recipe was added to meta-virtualization on master bran=
ch:
>> >
>> > http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/rec=
ipes-extended/libvmi/libvmi_git.bb
>> >
>> > But I use krogoth branch with my current board, so, tried to copy the =
recipe to krogoth branch but throw error on libvirt about: Nothing PROVIDES=
 libxl, then added new dependencies found on libvirt from master and now th=
rows: Nothing PROVIDES libdevmapper, so I guess the best approach should be=
 to request backporting libvmi to krogoth branch.
>> >
>> > Your help is much appreciated.
>>
>> Hector,
>>
>> So what would have happened is krogoth was branched and then at some
>> later time a commit was applied to master which added the
>> libvmi_git.bb recipe. So start by using git to identify this commit,
>> you can do this while on the krogoth branch still
>> ie.: git log master -- ./recipes-extended/libvmi/libvmi_git.bb
>>
>> This will identify commit e2ab59ec3e4b547da635cda725090d42126dcfd2 as
>> the commit which brought in the libvmi_git.bb recipe, so cherry-pick
>> it
>> ie: git cherry-pick e2ab59ec3e4b547da635cda725090d42126dcfd2
>>
>> Now attempt to build it 'bitbake libvmi', as you have indicated this
>> most likely fail as libvirt will require libxl. DO NOT port the
>> libvirt recipe from master back to krogoth, libvirt has been around
>> for ages in meta-virtualization and libvmi does not have a version
>> dependency on libvirt. Instead when you inspect the libvirt recipe
>> already present on the krogoth branch you will see that libxl is a
>> dependency we can control, we need to ensure we have a suitable
>> PACKAGECONFIG for libvirt AND that "xen" is not set in the
>> DISTRO_FEATURES. By default neither of these are set so without having
>> access to your build I don't know where you are setting either of
>> these, you will have to use bitbake -e libvmi or similar to find out
>> where your build is setting either of these and mitigate against this.
>>
>> Try the above and follow up and we can then move on with any other
>> bits. It is important that you can prep the backport as you have the
>> krogoth build ready to go along with a usecase to test the backport,
>> something Bruce will not have.
>>
>> Regards,
>> Mark
>>
>>
>>
>> >
>> > Please let me know if possible.
>> >
>> > Thanks
>> >
>> > --
>> > Hector
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


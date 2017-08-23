Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 48791E00D50; Wed, 23 Aug 2017 00:00:53 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.161.195 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.195 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f195.google.com (mail-yw0-f195.google.com
	[209.85.161.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5C2ECE00CAB
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 00:00:51 -0700 (PDT)
Received: by mail-yw0-f195.google.com with SMTP id s143so509052ywg.4
	for <meta-virtualization@yoctoproject.org>;
	Wed, 23 Aug 2017 00:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=GVLfVW4UWYNMVagn4rF+z3hl2hJIZmqOUTVWh0tXdw4=;
	b=TziJkBVDhkf2ht5nNzrtvnl45aFpThQn+//y9Yzodkx+60oXRXiZWoexPg1aJx84AG
	5c+f1wZ7DYHfeLGxxHNRD9Y+2oQTIC6yY+TzcEQoJNCUSixPj7An0nqBAuw5fwFHES4i
	rljvKVGRIWMqEB2euS6QLEDaj7IZjROB2Yz9S2mDCSDcUmhGgDWK1uvgSOgcleGj45MY
	abBDQr83TUb4KTN1WLpjLwrqfpjFMSri3HzZSIbew55OmAk178BLQaP7G+r0EDki1YUn
	vkvp5zIUAHINj0UODZJ7IsRrQ89bn/JFhi039l4KemMNc9MKBfc+0u3Qxf4gy6hwES9Q
	av+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=GVLfVW4UWYNMVagn4rF+z3hl2hJIZmqOUTVWh0tXdw4=;
	b=i/jcCy4BI+XhqJJegoSd1EXbwWJQxGFVeCbi5gm0VtIPE0cqssfE/VtpxPtgTicUfm
	aFHxvxpetIfyPB3PheK0zQmYvza2SCwEoQhIsjFWSXvSyj+YIwuUgIF9NyuoRVliwiRa
	WkM7aOfe8MjFLTgIzgxBFeJmTvlojIO5fqUAj1J+yYIsojY6bUGvY9qG9KC08a1FVwa5
	eNFo8+ABzl7tFS20FUr+3dpu4vpZS9VUkpyDGrghG0EAGDSBFAjbSwh6FKL3O/4SUO/W
	HXkL3oEwdTpp6RPvEQQ7dfsglhaS4g/Ao3I5UlIwyiLhRT47dlVt/9enYbn5dOVuWeaI
	y6ww==
X-Gm-Message-State: AHYfb5iecZiftEzGuv0ncY+/M8GUiIgrK72KyaHQmMmNEtgYiJa9bw80
	iqOKs7viBpys0Z+sg+44A0ox3xKQLQ==
X-Received: by 10.37.36.144 with SMTP id k138mr1256325ybk.211.1503471651211;
	Wed, 23 Aug 2017 00:00:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.175.4 with HTTP; Wed, 23 Aug 2017 00:00:50 -0700 (PDT)
In-Reply-To: <CADkTA4PS==zpgYYFdsnubPY_8N0bx=SOfHEwU60qZ948x1dXMg@mail.gmail.com>
References: <1503378503-23353-1-git-send-email-christopher.w.clark@gmail.com>
	<1503378503-23353-5-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4PS==zpgYYFdsnubPY_8N0bx=SOfHEwU60qZ948x1dXMg@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Wed, 23 Aug 2017 00:00:50 -0700
Message-ID: <CACMJ4Gbsp24Lp661X4goHrxhchOuxVcjs3cBMpArZcbxL_wdHQ@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>
Subject: Re: [PATCH 4/4] xen-image-minimal : change SYSLINUXCFG to SYSLINUX_CFG
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
X-List-Received-Date: Wed, 23 Aug 2017 07:00:53 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 22, 2017 at 7:47 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Tue, Aug 22, 2017 at 1:08 AM, <christopher.w.clark@gmail.com> wrote:
>> From: Christopher Clark <christopher.clark6@baesystems.com>
>>
>> Fixes the build for xen-image-minimal.
>
> What change triggered the need to update the variable ? It would be nice to
> log that in the commit message.

Agreed. I can respin the patch with an updated description.

> I did a quick grep and didn't find the root cause.

It looks like this is it:

git://git.yoctoproject.org/poky.git
commit bb1c719250cecc8725147cbdd999a9a44a11b549
Author: Robert Yang <liezhi.yang@windriver.com>
Date:   Wed Feb 24 01:23:58 2016 -0800

    syslinux.bbclass: make vm and live can be built together

which touches: meta/classes/syslinux.bbclass

The above commit indicates that it is taken from openembedded-core:

git://git.openembedded.org/openembedded-core
commit e38c94d6bf83ed3ca7f046d9503e81b927487bf2

Christopher


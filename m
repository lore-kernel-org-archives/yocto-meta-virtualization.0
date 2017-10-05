Return-Path: <pbarker@toganlabs.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C2147E00D7F; Thu,  5 Oct 2017 09:15:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [74.125.82.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.82.44 listed in dnsbl.sorbs.net]
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 5AA49E00C77
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 09:15:47 -0700 (PDT)
Received: by mail-wm0-f44.google.com with SMTP id l68so3199884wmd.5
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 09:15:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=toganlabs-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=rxBw44KGrcxfyQxiWN9yEs3ha34XF7OKNc4Th718HmM=;
	b=UcXQhs5X27pwT9Dhq0GEuEHPaLhv/pcwMVWTIRxgPT3u/sdz0nHHvbIlaR/1zkh9Ws
	HiPhOYnPIpZtdUEwhVSGqlgOo7kqq6glDNHHgW2kt3/6m2jVyuokNfEfF9rxvA6E6mQL
	y3x5bwp8F6k3+RD0ypyEwrD11lfEJXJOQKQfWOc6V2t/qRvj8xrR5tkdqNKWeBG0WdhG
	nnE2tvzGnmy7WvptViEreOW91l+fGoXC+6LVZiYTL66Ji568ohWNGV1jcy+AgBKtGK4O
	hrxSdqzCJQysFOdKwHYPgdGXb/d/vxZ1VXimqsSCuZR+K8RYJxaIimCCeFQ0bSu6ok0Z
	RndA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=rxBw44KGrcxfyQxiWN9yEs3ha34XF7OKNc4Th718HmM=;
	b=ZorCIXOU3RWxA2iE+w5guI36jODhfTfOkqZEJhwH1UwxNq2JOztjkYN7C5//6xEddF
	8IxUQJJoFpU8MBEk/KJlaWmzlXK+ciNeYqpDYNUiojgueBlkSv+tgf8ZG7YrjYsjiUVM
	3qMJpJjZSsA9D0LJWlo7uHbjctYveGG4FpEpohM7SI/DVxSoVdGSRPK3Ge2qFzw4Vhev
	hHBKOO6pLtht15yp/evtQ3zhBj/JryohjfX4hE0w7Jwnn8gp02nLD861mpti741Ce3mk
	ivFAPaEb3DKuTlpiQPPYpwsvU5k9caZM7y7J1aKfNfhagQ41uMqItqA/nDbqq4i5tsvP
	bH1A==
X-Gm-Message-State: AMCzsaVHYMMPRoAyt9xqNxeG3EU4m35yCXALi7tEw6PRmvfRah9CKvcM
	JBPpUm91GCmQyfYKSXs2CKJsAg9BSh2jGCfRP49few==
X-Google-Smtp-Source: AOwi7QCgTUu/ifpQVJESU+Iz8lnqKQ0Ex5r3xD9ufpfMiB8XuQ9hExniiqFJD8qw4wZpceUHuo9g0MrZML8KIx6VpXE=
X-Received: by 10.28.19.11 with SMTP id 11mr20894233wmt.122.1507220146972;
	Thu, 05 Oct 2017 09:15:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.173.139 with HTTP; Thu, 5 Oct 2017 09:15:46 -0700 (PDT)
In-Reply-To: <CADkTA4NNPF4v4nArrR94Wcxp+kJi3c-5WXinU=qrqjxp2AQruA@mail.gmail.com>
References: <20170930030617.21104-1-Qi.Chen@windriver.com>
	<CADkTA4NNPF4v4nArrR94Wcxp+kJi3c-5WXinU=qrqjxp2AQruA@mail.gmail.com>
From: Paul Barker <pbarker@toganlabs.com>
Date: Thu, 5 Oct 2017 17:15:46 +0100
Message-ID: <CAPyrkgzrqg_XnGwByBz_uiP_r9kXixT9Dkk_jwoPkwtx=2mcJg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH V4 1/3] sanity-meta-virt.bbclass: add class for bbappend files checking
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
X-List-Received-Date: Thu, 05 Oct 2017 16:15:49 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 2, 2017 at 6:12 PM, Bruce Ashfield <bruce.ashfield@gmail.com> w=
rote:
> v4 is merged.
>
> Bruce
>
> On Fri, Sep 29, 2017 at 11:06 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>> Add a new class, sanity-meta-virt.bbclass, to check for whether necessar=
y
>> settings are available for bbappend files in this layer to be effective,
>> and warn users if not.
>>
>> In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable us=
ers
>> to explicitly skip the checking to avoid unwanted warnings.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  classes/sanity-meta-virt.bbclass | 10 ++++++++++
>>  conf/layer.conf                  |  4 ++++
>>  2 files changed, 14 insertions(+)
>>  create mode 100644 classes/sanity-meta-virt.bbclass
>>
>> diff --git a/classes/sanity-meta-virt.bbclass b/classes/sanity-meta-virt=
.bbclass
>> new file mode 100644
>> index 0000000..bd2b717
>> --- /dev/null
>> +++ b/classes/sanity-meta-virt.bbclass
>> @@ -0,0 +1,10 @@
>> +addhandler virt_bbappend_distrocheck
>> +virt_bbappend_distrocheck[eventmask] =3D "bb.event.ConfigParsed"
>> +python virt_bbappend_distrocheck() {
>> +    skip_check =3D e.data.getVar('SKIP_SANITY_BBAPPEND_CHECK') =3D=3D "=
1"
>> +    if 'virtualization' not in e.data.getVar('DISTRO_FEATURES').split()=
 and not skip_check:
>> +        bb.warn("You have included the meta-virtualization layer, but \
>> +'virtualization' has not been enabled in your DISTRO_FEATURES. Some bba=
ppend files \
>> +may not take effect. See the meta-virtualization README for details on =
enabling \
>> +virtualization support.")
>> +}
>> diff --git a/conf/layer.conf b/conf/layer.conf
>> index be08a98..51ca8ee 100644
>> --- a/conf/layer.conf
>> +++ b/conf/layer.conf
>> @@ -22,3 +22,7 @@ require conf/distro/include/virt_security_flags.inc
>>
>>  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-docker"
>>  PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-docker"
>> +
>> +# Sanity check for meta-virtualization layer.
>> +# Setting SKIP_SANITY_BBAPPEND_CHECK to "1" would skip the bbappend fil=
es check.
>> +INHERIT +=3D "sanity-meta-virt"
>> --
>> 2.11.0
>>

I'm getting this new warning up to 4 times on each bitbake invocation:
twice before the "Parsing recipes" line, once after the "Executing
SetScene Tasks" line (if present) and once after the "Executing
RunQueue Tasks" line.

It's also totally irrelevant for users of a distro like ours (Oryx
Linux) which includes meta-virtualization for runc, docker or other
related tools but doesn't use kvm or xen.

I guess I can set SKIP_SANITY_BBAPPEND_CHECK in our distro config but
this sounds like a universal skip for all sanity bbappend checks - is
this intended? Or does this variable just apply to the check in this
layer? If it's specific to this layer I think it needs a better name.

Thanks,

--=20
Paul Barker
Tog=C3=A1n Labs Ltd


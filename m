Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 31F27E00D87; Thu,  5 Oct 2017 12:48:20 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.193 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0CCACE00C9F
	for <meta-virtualization@yoctoproject.org>;
	Thu,  5 Oct 2017 12:48:18 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id o52so27551454qtc.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 05 Oct 2017 12:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=OHKl8X4rdrXeKLIRMOtJzYcgaMB2FYasAODEcm9cxJE=;
	b=EEW3RlrhbZyc+wxGIC0iC4LB+SEk5f8rGKq47LxI6c+ldCXZk1UgZWfrxCTS8V+20Q
	LpdnKgJcWEFBp1d5DFJKr0Y8zf1KXKlcrps04EM/8Wt3yGCdf/CsdIC42nRV7rx/sEwk
	+4TJZ83xPLO92YQ+P8vnKJitfQf0saNUzApdhPM0rGD0pL7szSJb1X7Iyjrd+8UHyGt7
	wPwjalcha6n/8ROtZw0aw/hfBwt9WFq9+FNEJwqkM27WRO4y7vcZoeKPPuPsZVqZT3T/
	5wtKm1AMXIDbpZHt7ChgIzoXzlXnsyfO2ldEe3JkpVynl/SoeR/ouor293dH/W2biqXx
	MzNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=OHKl8X4rdrXeKLIRMOtJzYcgaMB2FYasAODEcm9cxJE=;
	b=A3qOBOTOAd9whSuTTGCVGz7lNb4GJ1amAmDgo0u3i6eTIilsh/iYqxrCq4CyjwFyfG
	oSsvtTth0a/InAdEGLGUH2qlezTV+cev2fZS/JI104eYxGqagLrtoG32zMtLdqyh5TSZ
	+G9IYBXapGy4BWVMtw/aUQcFGSoUzW6vzHd2TB6ULVntHXmv/CvZuhuchFLCsJz3OMIB
	SerjVUOx+vDMDdhU3PuvDxNEZmIq2S5svoViVyZj1fDIGVlV5Lki9frgwWEirQ3yABNV
	BZbV6VBAb1/PPgvWNfcenN9QXR4wHQn0vE4wq3Kv7MqCoMHWbBDFxSiEEGTLhnPCctIn
	agDw==
X-Gm-Message-State: AMCzsaWUqAlFFKvJdRDA7RtPT59J3MdglhRJ2o/3tKXh1OGWCf8L1g09
	2jzJR/hjK56NV7W6WHWR6T5oTSbbDVIiwPramHo=
X-Google-Smtp-Source: AOwi7QD0HSDP446DtLhqyIvL4++Rb+XR33mhVEz0ZiX/k5sE1o6F3bUcEwzEtczKAKl2nQmKF2+G5YBQxoKEgZ30hW0=
X-Received: by 10.200.57.164 with SMTP id v33mr5913687qte.204.1507232897995;
	Thu, 05 Oct 2017 12:48:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Thu, 5 Oct 2017 12:48:17 -0700 (PDT)
In-Reply-To: <CAPyrkgzrqg_XnGwByBz_uiP_r9kXixT9Dkk_jwoPkwtx=2mcJg@mail.gmail.com>
References: <20170930030617.21104-1-Qi.Chen@windriver.com>
	<CADkTA4NNPF4v4nArrR94Wcxp+kJi3c-5WXinU=qrqjxp2AQruA@mail.gmail.com>
	<CAPyrkgzrqg_XnGwByBz_uiP_r9kXixT9Dkk_jwoPkwtx=2mcJg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 5 Oct 2017 15:48:17 -0400
Message-ID: <CADkTA4MiWQg8sR64EOB5+4wMtrnVoYO6Y6BOj6qvNCMxOcM07g@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
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
X-List-Received-Date: Thu, 05 Oct 2017 19:48:20 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 5, 2017 at 12:15 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> On Mon, Oct 2, 2017 at 6:12 PM, Bruce Ashfield <bruce.ashfield@gmail.com>=
 wrote:
>> v4 is merged.
>>
>> Bruce
>>
>> On Fri, Sep 29, 2017 at 11:06 PM, Chen Qi <Qi.Chen@windriver.com> wrote:
>>> Add a new class, sanity-meta-virt.bbclass, to check for whether necessa=
ry
>>> settings are available for bbappend files in this layer to be effective=
,
>>> and warn users if not.
>>>
>>> In addition, a variable SKIP_SANITY_BBAPPEND_CHECK is added to enable u=
sers
>>> to explicitly skip the checking to avoid unwanted warnings.
>>>
>>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>>> ---
>>>  classes/sanity-meta-virt.bbclass | 10 ++++++++++
>>>  conf/layer.conf                  |  4 ++++
>>>  2 files changed, 14 insertions(+)
>>>  create mode 100644 classes/sanity-meta-virt.bbclass
>>>
>>> diff --git a/classes/sanity-meta-virt.bbclass b/classes/sanity-meta-vir=
t.bbclass
>>> new file mode 100644
>>> index 0000000..bd2b717
>>> --- /dev/null
>>> +++ b/classes/sanity-meta-virt.bbclass
>>> @@ -0,0 +1,10 @@
>>> +addhandler virt_bbappend_distrocheck
>>> +virt_bbappend_distrocheck[eventmask] =3D "bb.event.ConfigParsed"
>>> +python virt_bbappend_distrocheck() {
>>> +    skip_check =3D e.data.getVar('SKIP_SANITY_BBAPPEND_CHECK') =3D=3D =
"1"
>>> +    if 'virtualization' not in e.data.getVar('DISTRO_FEATURES').split(=
) and not skip_check:
>>> +        bb.warn("You have included the meta-virtualization layer, but =
\
>>> +'virtualization' has not been enabled in your DISTRO_FEATURES. Some bb=
append files \
>>> +may not take effect. See the meta-virtualization README for details on=
 enabling \
>>> +virtualization support.")
>>> +}
>>> diff --git a/conf/layer.conf b/conf/layer.conf
>>> index be08a98..51ca8ee 100644
>>> --- a/conf/layer.conf
>>> +++ b/conf/layer.conf
>>> @@ -22,3 +22,7 @@ require conf/distro/include/virt_security_flags.inc
>>>
>>>  PREFERRED_PROVIDER_virtual/runc ?=3D "runc-docker"
>>>  PREFERRED_PROVIDER_virtual/containerd ?=3D "containerd-docker"
>>> +
>>> +# Sanity check for meta-virtualization layer.
>>> +# Setting SKIP_SANITY_BBAPPEND_CHECK to "1" would skip the bbappend fi=
les check.
>>> +INHERIT +=3D "sanity-meta-virt"
>>> --
>>> 2.11.0
>>>
>
> I'm getting this new warning up to 4 times on each bitbake invocation:
> twice before the "Parsing recipes" line, once after the "Executing
> SetScene Tasks" line (if present) and once after the "Executing
> RunQueue Tasks" line.
>
> It's also totally irrelevant for users of a distro like ours (Oryx
> Linux) which includes meta-virtualization for runc, docker or other
> related tools but doesn't use kvm or xen.
>
> I guess I can set SKIP_SANITY_BBAPPEND_CHECK in our distro config but
> this sounds like a universal skip for all sanity bbappend checks - is
> this intended? Or does this variable just apply to the check in this
> layer? If it's specific to this layer I think it needs a better name.

Fire off a patch to make the name more specific and I'll merge it right awa=
y.

I'm actively testing some other things, and have the distro flags set,
so I'd like a patch
from someone that was seeing the warning, and can confirm that we can actua=
lly
disable it.

Cheers,

Bruce

>
> Thanks,
>
> --
> Paul Barker
> Tog=C3=A1n Labs Ltd



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


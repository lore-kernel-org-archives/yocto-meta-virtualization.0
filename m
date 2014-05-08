Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 33DD5E00B45; Thu,  8 May 2014 06:39:21 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FROM,RCVD_IN_DNSWL_LOW,RDNS_NONE autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.180 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  1.3 RDNS_NONE Delivered to internal network by a host with no rDNS
X-Greylist: delayed 476 seconds by postgrey-1.32 at yocto-www;
	Thu, 08 May 2014 06:39:09 PDT
Received: from mail-lb0-f180.google.com (unknown [209.85.217.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2B5C8E00B43
	for <meta-virtualization@yoctoproject.org>;
	Thu,  8 May 2014 06:39:09 -0700 (PDT)
Received: by mail-lb0-f180.google.com with SMTP id p9so3586097lbv.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 08 May 2014 06:39:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=iB875vaVDYub5vmw/TNqsPezDK2Zp1DR2733bB2I6co=;
	b=PoT06Z0+RsrIu/nYOI1zlnj33F2rX3itQ0tW4cLqX2/p05YkxNbksFaWnaC3L/Rl16
	fYbLRuWrejpoaK/laQ5rd5AfzMEa5w5pZxvz3QVcZA2SPe6AmlkT2NQvIytz8acHRzr2
	cWiLDl6aZ0q4/lKeNYY/x6dUg14IEuZv2ibmpMLAG3LMDe+vYtyXMEMY2M5bcaLnJMjH
	vuSdvJPuxGppTQ2UcalTsy7dKSR9z8xbbNQIkL6EDi26mOKKryZDbPOldhNKP5/cKwMA
	39jECYhqYIWEB9B4v/+8qFDQxQTQSO96oNTe+tKY1C8w/xnCKiEPU74sf8iJ7gJn7sgw
	btHw==
MIME-Version: 1.0
X-Received: by 10.112.64.33 with SMTP id l1mr1777411lbs.79.1399555871835; Thu,
	08 May 2014 06:31:11 -0700 (PDT)
Received: by 10.112.58.132 with HTTP; Thu, 8 May 2014 06:31:11 -0700 (PDT)
In-Reply-To: <20140508122713.GB29985@iapetus.enea.se>
References: <20140507151308.GC18437@iapetus.enea.se>
	<CADkTA4MvZSR1ydH1FdUByfEGQ0fdP4znUFCm2+ujQHMdzEHrAA@mail.gmail.com>
	<20140508122713.GB29985@iapetus.enea.se>
Date: Thu, 8 May 2014 09:31:11 -0400
Message-ID: <CADkTA4PqmKMr1HwZVXBEfTgZkiUKs5WLKDC2N34t=yQbqoF+kw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Josep Puigdemont <josep.puigdemont@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: daisy
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
X-List-Received-Date: Thu, 08 May 2014 13:39:21 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 8, 2014 at 8:27 AM, Josep Puigdemont
<josep.puigdemont@enea.com> wrote:
> On Wed, May 07, 2014 at 12:29:51PM -0400, Bruce Ashfield wrote:
>> On Wed, May 7, 2014 at 11:13 AM, Josep Puigdemont
>> <josep.puigdemont@enea.com> wrote:
>> > Hi,
>> >
>> > with yocto 1.6 released, I wonder if a daisy branch for meta-virtualization
>> > is planned, as there was one for dora.
>>
>> There is one planned. I was just waiting for the dust to settle before
>> pushing the one I tagged at the time of the release.
>>
>> I was looking into one issue with libvirt against the release, but once that
>> is confirmed or denied, I'll push a branch .. unless someone beats me to
>> it :)
>
> Looks like someone did beat you and created the daisy branch already, unless
> it was you, of course ;-)

It was me :) But you did beat me to informing the list that the xeon issue was
a fire drill and not a real problem!

The patches to fix the B != S issues, and some pending libvirt updates, etc,
definitely forced my hand in creating the branch.

If anyone has issues with where I had branched and tested, yell .. and we can
fix it up.

Bruce

>
> /Josep
>
>>
>> I typically build meta-virt master against mutiple versions of the core, so
>> it does work and with the wildcard bbappends .. that'll only get easier.
>>
>> Cheers,
>>
>> Bruce
>>
>> >
>> > Thanks,
>> > Josep
>> > --
>> > _______________________________________________
>> > meta-virtualization mailing list
>> > meta-virtualization@yoctoproject.org
>> > https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>> --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>> thee at its end"



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


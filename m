Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0F224E00796; Mon, 11 Aug 2014 09:09:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.215.44 listed in list.dnswl.org]
Received: from mail-la0-f44.google.com (mail-la0-f44.google.com
	[209.85.215.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9969DE004F2
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Aug 2014 09:09:19 -0700 (PDT)
Received: by mail-la0-f44.google.com with SMTP id el20so5901799lab.31
	for <meta-virtualization@yoctoproject.org>;
	Mon, 11 Aug 2014 09:09:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=uznNI1iHrSeL5vINk9RalVxmVFnkyaD4EQrfPBGRJgM=;
	b=Ikfjq13GrzikJOy3U/EpjboVyyIGFSmURAt3pU8ouzIWsJttV9TWlW3HkdE3WViJlO
	61u0r4yBYAAsGd4nHyMf388ZgFJ/ZWYCPv0v1AtcoMTreO54PY1PiFo/eHKu2Sxliagr
	KQWXDJ8taNPCFSJpYwZ2G2a6zm8295HRw2rndjQB60f6g/D4z9/OCYpcWIYMECsf/rlW
	d6XhyYG64aCNtX5OZv4Zl8/4K6ScHIfU2JQq7XPCuTwCyQFJ2msidb+PdH7Roi4W/pUZ
	L6mHSmlqw8A47U65cbOS8q25jGRPIQfbHX7EEqJSFJ+GPuTPLQ8tMukH7ggCKtpV+aLM
	+FSA==
MIME-Version: 1.0
X-Received: by 10.152.88.109 with SMTP id bf13mr2589451lab.92.1407773358786;
	Mon, 11 Aug 2014 09:09:18 -0700 (PDT)
Received: by 10.112.202.67 with HTTP; Mon, 11 Aug 2014 09:09:18 -0700 (PDT)
In-Reply-To: <2423043.jtrRQzBGRa@peggleto-mobl5.ger.corp.intel.com>
References: <2423043.jtrRQzBGRa@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 11 Aug 2014 12:09:18 -0400
Message-ID: <CADkTA4OcnP+Q3wvVatb-_Ny4nHjycnQ=FhMuCQwRD2p_cWqrbg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: meta-openstack Python support recipes
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
X-List-Received-Date: Mon, 11 Aug 2014 16:09:31 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Aug 11, 2014 at 8:43 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> Hi there,
>
> There are quite a few Python support recipes in meta-openstack. Now that the
> meta-python layer has been established, would it be reasonable to move those
> that are generic and not related to virtualisation over to meta-python and
> make meta-openstack depend upon that, so that those recipes can be (a little)
> more easily reused by others?

At this point no. I intend to keep them all in meta-openstack, since the version
and cadence is tightly coupled to the core components, and spreading them
across multiple layers is a recipe for chaos.

Bruce

>
> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


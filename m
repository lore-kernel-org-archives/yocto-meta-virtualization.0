Return-Path: <christopher.w.clark@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CFD5DE00C8A; Sun, 17 Sep 2017 18:02:13 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (christopher.w.clark[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.193 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 568FBE00C3A
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:02:12 -0700 (PDT)
Received: by mail-qt0-f193.google.com with SMTP id q8so4791654qtb.1
	for <meta-virtualization@yoctoproject.org>;
	Sun, 17 Sep 2017 18:02:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IlO31DBOXYNaMD2GkZRc69zK1aGhUuhY/O+sp1E2cgQ=;
	b=vDuqOyogqEfJnafDRv6W86S8cAMdtsJh9FC6QkCmx9/gtMppsDFBJM9knpb+nYiiQl
	i2uM+hfbyCQbDmR4kT9kfrzaBLb0hGRDUhmAvjb1QjmRyI5YWdqaheh9P28NHvQiIf7J
	HOSb0U66pKdgoYdnKY1Q1IZDFhZpCHZGJIEvjUYSe8a7+Qtsx9iOikslzuq61MgBuQqW
	wbZuAry7FTnwPrbqdCizloV6RyBpQtKOxTEQO28MulHA/sfhRySoBAka7GQL8HgoP2Q6
	cOlUrLB/91s8sbme2bDF8XSn/2no/3bY7wg2nr8sMZRKLx2av972jwgoPki40BpQMCj0
	ydWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IlO31DBOXYNaMD2GkZRc69zK1aGhUuhY/O+sp1E2cgQ=;
	b=iNMm/43F5oyhNHDbxdPDwFjYFbyeNaJQLfKyIPDCqS7inpycd5YZDZucXGFCx76CpV
	MBpbVuId5STlSYhGGefyigKX4SAtDophUPiVnpFM0RXrYSD500WVJiaT22br5q8FDjpG
	w3dcDYd1enmTMdKfo7RP0qQc87HCSz0WVNRAf+TLF9sWlpDM3bwlK3doyINmSB12xcfq
	qQPdAbZ/UTeSyfXefryWvUx8mREFPqNu0yfV9VoXvfyDlDFWIlUdf2uPHHlTEMycfYHe
	9/p6Bcg8FviN2pApCpLdZtOJVJG5JuxZLAcZqB+QnKfYN/LGvMgoHYmkO9ih8Arbmg5c
	AkQg==
X-Gm-Message-State: AHPjjUiWkVR1qP8XlDJagClUGuU07Rw1eetP1agQvHGSRTcuIhregC51
	oiHKjKVgfk0ENh/pQ6LYhVEVDxxMrG4eOJVR2vA=
X-Google-Smtp-Source: AOwi7QDZD1MQr2lB7fhsnnSa2eMkd/9AIHSAHMnxx9D5gIt5dJecOpSVrLK0pjBbVXBl9+KEKkUZZCBWFCupLmy+WbU=
X-Received: by 10.237.37.91 with SMTP id w27mr48942168qtc.71.1505696532449;
	Sun, 17 Sep 2017 18:02:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.91.6 with HTTP; Sun, 17 Sep 2017 18:02:11 -0700 (PDT)
In-Reply-To: <CADkTA4Pq3E4=sSx-Ne2YBbv_Umz1fd4BYmDV6BPGXppH3HmKxg@mail.gmail.com>
References: <1504739341-28234-1-git-send-email-christopher.w.clark@gmail.com>
	<1504739341-28234-2-git-send-email-christopher.w.clark@gmail.com>
	<CADkTA4Pq3E4=sSx-Ne2YBbv_Umz1fd4BYmDV6BPGXppH3HmKxg@mail.gmail.com>
From: Christopher Clark <christopher.w.clark@gmail.com>
Date: Sun, 17 Sep 2017 18:02:11 -0700
Message-ID: <CACMJ4Gb0RGRKK419=f30p=fPPSvj4n2=Eubhzcfy9SbNy2NKYA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, Doug Goldstein <cardoe@gentoo.org>,
	nathan.studer@dornerworks.com
Subject: Re: RFC: [PATCH] xen-guest-image-minimal: Fix non-x86.
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
X-List-Received-Date: Mon, 18 Sep 2017 01:02:13 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Sep 14, 2017 at 1:31 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Wed, Sep 6, 2017 at 7:09 PM, <christopher.w.clark@gmail.com> wrote:
>>
>> From: Christopher Clark <christopher.w.clark@gmail.com>
>>
>> Fix xen-guest-image-minimal image for non-x86, both with and
>> without x11 included.
>
> I haven't heard any objections to this series, did you want to send it again
> as a non RFC
> and I'll get it merged.

Thanks, Bruce.

I'm comfortable with this patch going in - I'll resend a non-RFC
version that is slightly tidier in the xserver-xorg bbappend, but
functionally equivalent.

Alistair was aiming to test this but encountered a different issue
along the way. I'll be sending the patch to fix that and a couple of
others shortly.

I'm still open to following up on any feedback once testing has been
unblocked, but I think that'll best be done as a separate change
beyond one this if needed, rather than holding this one back.

Christopher


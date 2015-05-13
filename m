Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 01464E0095C; Wed, 13 May 2015 12:18:44 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.160.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yk0-f173.google.com (mail-yk0-f173.google.com
	[209.85.160.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 773BCE00820
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 12:18:41 -0700 (PDT)
Received: by ykft189 with SMTP id t189so17494774ykf.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 13 May 2015 12:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=BqTX23pTbWdPwTDtLtSRwYTygeWk8QDmGIAmzM9mrEI=;
	b=dnZCZV5qVk8+oO8BrzhxKC12/psuH33vt69eB5Ds4WJXAjpFLoM9YmFiGeoVKaYSAt
	mdedq6DYGG1qaDWsv+nRGeqmZ0XlnYy3zwenIFPRiM3vQJAeSIk8TwxHYgWxhDX/cObJ
	x0kQUB08a78oAzneds92kVLY5uRrc5GfR9/J7S0wGbIJ04yae1Izf+ybDehIaiHM7Qfp
	TiHz3vGu5fGLQy9ZDCtQy9WRtSwp0Xgms6W1lNdW/yiJ1h+PczT+Ujhh09bpigUVDEhB
	M0bxn4OapUuOzFytiHBcpLDA/RO6LA96eZyH/M/7Sjzh3rAb/tX3aJLLpLllxo5+Diy3
	o6nw==
MIME-Version: 1.0
X-Received: by 10.236.63.104 with SMTP id z68mr467886yhc.22.1431544721382;
	Wed, 13 May 2015 12:18:41 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Wed, 13 May 2015 12:18:41 -0700 (PDT)
In-Reply-To: <CAGMdoF=9aYsk833uVyccFt+pU09XVKB62eyCxwoCLOqj+q9yJQ@mail.gmail.com>
References: <CAGMdoF=9aYsk833uVyccFt+pU09XVKB62eyCxwoCLOqj+q9yJQ@mail.gmail.com>
Date: Wed, 13 May 2015 15:18:41 -0400
Message-ID: <CADkTA4OLLBzZuS43DoBa464X7v6CZUqbDueAeen8YVMKGP8kXw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Edward Wingate <edwingate8@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: meta-cloud-services branch names
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
X-List-Received-Date: Wed, 13 May 2015 19:18:45 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, May 13, 2015 at 1:47 PM, Edward Wingate <edwingate8@gmail.com> wrote:
> Why are the branch names for meta-cloud-services (kilo, juno, havana,
> etc.) different than poky and most other meta- layers (daisy, dizzy,
> fido, etc.)?  I'm a new Yocto user and up until now, the meta layers I
> have been using have the same branch names as poky and I have been
> syncing according to branch names.  Is this not necessary with
> meta-cloud-services?  Thanks for your help.

The branches follow the openstack releases, not the Yocto release strategy.
The content in the layers are the most part independent of the particulars
of the Yocto releases, hence are using a different branch naming at the moment.

We also at times test multiple openstack/cloud releases against various Yocto
releases, so the 1:1 branch naming doesn't make sense in that context.

It isn't perfect, since it is true that there are dangling bbappends and other
fixups, but over time with the use of % wildcards in the bbappends, we can
have quite a bit of independence from the actual release.

Bruce

> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


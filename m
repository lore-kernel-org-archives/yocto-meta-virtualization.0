Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BAC7E01067; Tue, 10 Jul 2018 06:52:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.208.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
	[209.85.208.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 72AC4E00BFB
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:51:59 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id a6-v6so16801757ljj.7
	for <meta-virtualization@yoctoproject.org>;
	Tue, 10 Jul 2018 06:51:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=oCWxLMLVKpi5ujERUd+vGKIdWWyvEeFlboyzioj5YwY=;
	b=nXFbIT7O5IRkLhIZ7GV7PQeD6bc0L4LqCkl/ULLjsYibS0SVl2yU2ibH0KSVuGENuf
	M+5yk6DEo1VO08r3gVWYpnlBzQrd864MtDIc3kvASAK+1ZCKYLMJME563mzUtC9xgTXC
	rXoHo285qY5CCH/dWVqRiZA3yt8Ak9nx1IvUrFT5p1tUVq7l1iWYLYHe455z+c1dbxKP
	jiyAhR5F0Q57OEY8REUKXcON/dzOgORrME1JXXlEC7K7uR7rofalmn5n/TCh8nbLc730
	4QzK4H3g/GhSbL1LF96xmz4lVPdCTacGg1vTy9/KbpGYJ8hfz31FfW4djzfTCrqUzdRr
	bB/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=oCWxLMLVKpi5ujERUd+vGKIdWWyvEeFlboyzioj5YwY=;
	b=nqlCpGp+Ineqt4OxtzDyXaaUSuL2NR4BUd0kk6TCKLAmHxFEmblz5L7PA5490ezeA+
	R0am1qc3YDZOTemjkuw/5I+xurv1KF1wSY2lfaB3biELeLvoTWRLnNr8F7NcTq+ytXVI
	J0svqMhHP+XIGOMU7Ue1wEM19H0NVG9njtV3bunGb4grRdx3eFcuv4XxGKQj8tF5Qdqb
	XzyOx2BZvWrtoTBHpSMDhUchaKVwmIebkvlh5RWJFwa1O6780reVlTe8i36mTlp1+sB4
	Pv+goCBREmbBH9X0KbVb21D9lukAJvoXe+bTW651OkHgLfi9VwIme6ps1yJE2HvcCqYN
	MdKA==
X-Gm-Message-State: APt69E05QIf77a+0HBnAsLIwEBZZSSkZSnFwrZD5Ktcl6iIpvCpuJImF
	G5vt4XBW801a6JuYgq5g32TNjDEHzOckelTWHMKQPg==
X-Google-Smtp-Source: AAOMgpfUwCjYRv8LW2aNumUpaDdJONpI6+yuqz1ZYmkUuicHceI3clGh4nCxgv+87wjKGyLf1eGDw2LpAEP2NRNDiQM=
X-Received: by 2002:a2e:7815:: with SMTP id
	t21-v6mr8749323ljc.61.1531230718354; 
	Tue, 10 Jul 2018 06:51:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a2e:9acd:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 06:51:57
	-0700 (PDT)
In-Reply-To: <20180706212320.6023-2-jpuhlman@mvista.com>
References: <20180706212320.6023-1-jpuhlman@mvista.com>
	<20180706212320.6023-2-jpuhlman@mvista.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 10 Jul 2018 09:51:57 -0400
Message-ID: <CADkTA4OaBVKwNPrRuS_Ea-ioBAAmuqp3MhM1XFJSKngwyeNENQ@mail.gmail.com>
To: Jeremy Puhlman <jpuhlman@mvista.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [m-c-s][PATCH 2/2] libvirt: Update bbappend to match latest version
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
X-List-Received-Date: Tue, 10 Jul 2018 13:52:02 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Fri, Jul 6, 2018 at 5:23 PM, Jeremy Puhlman <jpuhlman@mvista.com> wrote:
> Signed-off-by: Jeremy Puhlman <jpuhlman@mvista.com>
> ---
>  .../libvirt/{libvirt_1.%.bbappend => libvirt_4.%.bbappend}                | 0
>  1 file changed, 0 insertions(+), 0 deletions(-)
>  rename meta-openstack/recipes-extended/libvirt/{libvirt_1.%.bbappend => libvirt_4.%.bbappend} (100%)
>
> diff --git a/meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend b/meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> similarity index 100%
> rename from meta-openstack/recipes-extended/libvirt/libvirt_1.%.bbappend
> rename to meta-openstack/recipes-extended/libvirt/libvirt_4.%.bbappend
> --
> 2.11.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


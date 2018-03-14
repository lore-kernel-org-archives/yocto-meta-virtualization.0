Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A7477E00E7D; Wed, 14 Mar 2018 05:35:26 -0700 (PDT)
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
	*      [209.85.215.66 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 09871E00B66
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:35:25 -0700 (PDT)
Received: by mail-lf0-f66.google.com with SMTP id l191-v6so4560700lfe.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 14 Mar 2018 05:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hmjxINZ73/aPWYWokbsSBNiaVN5FI8Jcd6tsSNAdufw=;
	b=n8T2eI7zy1tsTKKl8Z+Z/2lztihSW7zdUislNHsZOzhw5MLwU5Tmv8oK0NO3jl3BHi
	5+X23Q+quaFtT0fLouWw7B6ROFmj5lpzxrsjrIeKAiBZGvre263RcpRhMY2/sdbJgaPk
	ZLepgMOfSPzNNmwmug1lxkCxn7FECz+14dJ3y/t1VKypQWW93cHQBX881HswkzEVYyNd
	COA7IPNHRcVrHLt0hV28Krq9ulB5YrDQXgcN3A8fVdaeIt7NsFHNoIxdqBkYs0d9RZ2l
	WsqG8L1wtb183ShRQcgyBe7AEdzNVIiRmNwg9pfGrsJkh38qdId2WEexkdbmlBDN4zVs
	ZMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hmjxINZ73/aPWYWokbsSBNiaVN5FI8Jcd6tsSNAdufw=;
	b=c8cl8LOoIJkRVZvyX17dHMmi4UOB1vdvaACpF2lQqCLzsfNjQk5HwYqd65kNdi3JC4
	ZKKIqrKGAM29G4jMvkrEwjke7Dk73kL5K/Ee6leVkW2quK8qwP6zqCaA+1DBnWb+3HDJ
	1RmTepQYMb8MTXeKGLgK4I0O8yrvW8CQXTgi2bRcrxFExF06GYpdmUR/KX+/QkcKBjV9
	wme5fx2S4B5CuKK9ZNuz4KORZjWF9a/eYL0RlQ/5i5lTazu9aUu2fXxebTbpCkB63S4E
	JsgvA5dFhP9ui1OTaL9AeWh/R+5twsvQqZzMEOLG185kRU8WFY2blAd4yCYLwJzkF2MI
	hzjw==
X-Gm-Message-State: AElRT7HT7azqENCkGRqD5V0PjhcWn0vPK8Fb58WPi9UB5xx+asLuWOAc
	wXqdPYRWe2mewd/JIRS7MIMhQIballUhBTsHdMo=
X-Google-Smtp-Source: AG47ELs4AL+x6aXKdx+cNHGy0qwxk18sLesDP72jn1DT8HyV0xEcB4VYiXP2JqYgWjMoTngYnFqSazReYPSLJ+qHPhc=
X-Received: by 10.46.20.30 with SMTP id u30mr3406441ljd.12.1521030924545; Wed,
	14 Mar 2018 05:35:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Wed, 14 Mar 2018 05:35:23 -0700 (PDT)
In-Reply-To: <20180314083609.7907-1-pascal.bach@siemens.com>
References: <20180314083609.7907-1-pascal.bach@siemens.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 14 Mar 2018 08:35:23 -0400
Message-ID: <CADkTA4Oh0+aN9TUwMhDPEQyDOtRHzB4y-8rqJe2AE6O6gyzgRA@mail.gmail.com>
To: Pascal Bach <pascal.bach@siemens.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] linux-yocto: replace version specific appends
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
X-List-Received-Date: Wed, 14 Mar 2018 12:35:26 -0000
Content-Type: text/plain; charset="UTF-8"

I'm keeping the version specific bbappends, but thanks for the patch anyway.

Bruce

On Wed, Mar 14, 2018 at 4:36 AM, Pascal Bach <pascal.bach@siemens.com> wrote:
> All append to the same anyway and as long that there is no difference it
> can be simplified by having only one append for all versions.
>
> Signed-off-by: Pascal Bach <pascal.bach@siemens.com>
> ---
>  .../linux/{linux-yocto_4.12.bbappend => linux-yocto_%.bbappend}          | 0
>  recipes-kernel/linux/linux-yocto_4.14.bbappend                           | 1 -
>  recipes-kernel/linux/linux-yocto_4.15.bbappend                           | 1 -
>  3 files changed, 2 deletions(-)
>  rename recipes-kernel/linux/{linux-yocto_4.12.bbappend => linux-yocto_%.bbappend} (100%)
>  delete mode 100644 recipes-kernel/linux/linux-yocto_4.14.bbappend
>  delete mode 100644 recipes-kernel/linux/linux-yocto_4.15.bbappend
>
> diff --git a/recipes-kernel/linux/linux-yocto_4.12.bbappend b/recipes-kernel/linux/linux-yocto_%.bbappend
> similarity index 100%
> rename from recipes-kernel/linux/linux-yocto_4.12.bbappend
> rename to recipes-kernel/linux/linux-yocto_%.bbappend
> diff --git a/recipes-kernel/linux/linux-yocto_4.14.bbappend b/recipes-kernel/linux/linux-yocto_4.14.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-kernel/linux/linux-yocto_4.14.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> diff --git a/recipes-kernel/linux/linux-yocto_4.15.bbappend b/recipes-kernel/linux/linux-yocto_4.15.bbappend
> deleted file mode 100644
> index 617cacc..0000000
> --- a/recipes-kernel/linux/linux-yocto_4.15.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization', '${BPN}_virtualization.inc', '', d)}
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


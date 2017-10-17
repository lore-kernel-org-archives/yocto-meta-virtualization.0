Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 66AD7E00D14; Tue, 17 Oct 2017 10:21:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.220.180 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.180 listed in dnsbl.sorbs.net]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DE21DE00BE8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:21:28 -0700 (PDT)
Received: by mail-qk0-f180.google.com with SMTP id x82so2975152qkb.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 17 Oct 2017 10:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=djn5Xh0CO9UVqiapgS/ChWoAgwevAcS/SPcNJvhUJRk=;
	b=utINhgsa6nAzYWFZZbu7/5Et3z++6yCpyMJju28LuannyLaIo0k1MgcRh14r9gyHdm
	omgpjXiymqscRITZDrq5cWqDZef6nWCLM/NhJEf851omBoMNUhoy95p4EZYy88ZZA2sB
	j4M832tb/h94uUaHciVeTMltZ1qxbpWh1POQRe9478ChfbBVQCG0XE3qDmLRb+Tv3gBL
	FKGVqKrM4HwZTyl8ztIG8zNBeyVlaxXm+wkLRtK0WbFYaHq0TOF3lKXBHHBjIQZE70by
	2TclqvYEF7DAodK9REzYtoddW6UM9OQnwLqhEVD6MoDnumcPYE6fiGzEdE6uJM42HgEp
	R8og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=djn5Xh0CO9UVqiapgS/ChWoAgwevAcS/SPcNJvhUJRk=;
	b=F42wdd4XG1aQyuczzfjJ5Bj/Lf8fRsjNcV+36ppopjxPHguKMOux5FcIZ0VeFvPkb+
	y40rxNfZuOK5PC83WhD/v+G29yxVOuYgIVZTJZmuMvJvLS7RygiKfqvv+2z9DEVuS1Pc
	3Rf9jrV0bUgQogWUWbYOjARUiks1A1JDQCxUY65G/EdJLuuFNWogYNF3silQ9lxbHhvU
	F1lW9J6r37JhkFi3lIuzuknX+Iw+lIm+pbtjT2hrP3csAoTFET1z5loMPzNO5b4/kvp4
	qjgw2GfyeSlhG8p0TIt2n/DUhHjjaVIa1pt5oWlKS9E4n7UPXkO7Z6FKkpuq7USvh/S+
	c7Fg==
X-Gm-Message-State: AMCzsaU5a9Gh/2HkzQqD0Tos6m8vDuvQ0sho8PNxsFoQCaYiLYsUIARh
	bWVEtGB7Zw/sZ5rgWQ8o6VCv7FUDnDlOIpbyiSZDrQ==
X-Google-Smtp-Source: ABhQp+T2Xn50iPurbFJtyyKFh+N8zmij7drHsCTtRMmbVba9OVyplJ5CP2SvB0NBVjZA7Kren12VS0HfrszCpy/hlWI=
X-Received: by 10.55.159.4 with SMTP id i4mr919916qke.339.1508260888386; Tue,
	17 Oct 2017 10:21:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Tue, 17 Oct 2017 10:21:27 -0700 (PDT)
In-Reply-To: <1508206240-12051-1-git-send-email-ricardo@opensourcefoundries.com>
References: <1508206240-12051-1-git-send-email-ricardo@opensourcefoundries.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 17 Oct 2017 13:21:27 -0400
Message-ID: <CADkTA4PbN89+GJjBGiDvU80FDVJX1S89fG24GY-g6ka+fYD69w@mail.gmail.com>
To: Ricardo Salveti <ricardo@opensourcefoundries.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] python3-docker: add missing RDEPENDS
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
X-List-Received-Date: Tue, 17 Oct 2017 17:21:29 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Mon, Oct 16, 2017 at 10:10 PM, Ricardo Salveti
<ricardo@opensourcefoundries.com> wrote:
> Add python3-docker-pycreds, python3-requests and
> python3-websocket-client to RDEPENDS for a functional python docker
> module (otherwise even import docker fails).
>
> Signed-off-by: Ricardo Salveti <ricardo@opensourcefoundries.com>
> ---
>  recipes-devtools/python/python3-docker_2.5.1.bb | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/recipes-devtools/python/python3-docker_2.5.1.bb b/recipes-devtools/python/python3-docker_2.5.1.bb
> index ff8f89e..341d95c 100644
> --- a/recipes-devtools/python/python3-docker_2.5.1.bb
> +++ b/recipes-devtools/python/python3-docker_2.5.1.bb
> @@ -9,3 +9,9 @@ SRC_URI[md5sum] = "7d917152976df075e6e90ee853df641f"
>  SRC_URI[sha256sum] = "b876e6909d8d2360e0540364c3a952a62847137f4674f2439320ede16d6db880"
>
>  DEPENDS += "${PYTHON_PN}-pip-native"
> +
> +RDEPENDS_${PN} += " \
> +       python3-docker-pycreds \
> +       python3-requests \
> +       python3-websocket-client \
> +"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


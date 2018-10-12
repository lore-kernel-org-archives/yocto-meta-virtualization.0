Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2ED16E00B93; Fri, 12 Oct 2018 12:21:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D0B83E00B6C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 12:21:47 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id d4-v6so10097025lfa.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 12 Oct 2018 12:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bC7N8vTldpdF95MWB8t5TS9xQISe6GHYQXunA7Wr7to=;
	b=i8xsdga+9zvME6/zo+b4yz0yIB8QLbQCH1oCVN+yxvHN2xPax/MoihTPhwkg7W/FJR
	BMHjtU6cizr/MwM4pyiPtFoZJwRLztZjC53mGFwGgXgjQpJMcwTWSeQwz8T6HzvziKyJ
	hlwBeVVAfvufVx9dhhwtgJuR5mS7lnvh+1FM5nT4XMW+HARxhzOCbt8Es2k2uk4MCQo0
	SvSV3/G4AznNZOLEhr5M/9CSiIWT+6JUKDso13TH/6p7UcsNOuV3ZkDfqj1fkcjPf5AO
	OjBp5XoiAmFXcEqlOAHK4YsBtqNnMMwycrMP4MTN2s5x54jH6Slggxlazer9JrtddVgb
	yskA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bC7N8vTldpdF95MWB8t5TS9xQISe6GHYQXunA7Wr7to=;
	b=AvzuwRxBa3A5GS2NdlWR+/JUJF7tiFCNglYbBUckc4hFQFM0FoeOAa26+11zddmYFJ
	USoTmeqP8qtQNLt/YD3Y3phal9T8P4vXh1A0HGKKBctg4R84YA9bPoeF3zOm8pq43fQq
	XfKo5tuy0x7EfikQj1DILcAwEjP1cTVCJ3Oj31ZcOSiVocF3Sp+voT85nsHNXxUo1Vd6
	aiITqr9ngWGg8T96w7bS+7O1wm/nGSrpNxb6htbO8a/mkDqhIfDcRzh6I1qRj1L/K+CQ
	Eh4msu1yucsGzWTuV/iZmEk6aWByvf1XtNCIV7TjLBlRDEkhLnv1sR3x5CzJDczxyfb2
	QoLw==
X-Gm-Message-State: ABuFfoir+HpacF5Is9W0zpo5r70ZTWCoqYHBvRtxQ8fQs/mAoDWqxeA1
	1VtlcawXluZTxx1CYFwKe/2Ai6U0IUiixQyP6vk=
X-Google-Smtp-Source: ACcGV631FI6VaauUUp4HY1VJ+eIJCW1Yh2Vf0c1NnJtSzb98vU9xwGHUb8cwSrKDpANPl1Dw4qSfWAgvnvR4oJBsco0=
X-Received: by 2002:a19:c20e:: with SMTP id
	l14-v6mr4465099lfc.113.1539372106467; 
	Fri, 12 Oct 2018 12:21:46 -0700 (PDT)
MIME-Version: 1.0
References: <20181012165625.23124-1-okaya@kernel.org>
In-Reply-To: <20181012165625.23124-1-okaya@kernel.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 12 Oct 2018 15:21:34 -0400
Message-ID: <CADkTA4Ozm6yAW1KgS3-StuzSBj0_R5w9MS4zeOxDUGV2O6kj4Q@mail.gmail.com>
To: okaya@kernel.org
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [sumo] [PATCH v1] lxc: make error report compatible with ptest
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
X-List-Received-Date: Fri, 12 Oct 2018 19:21:49 -0000
Content-Type: text/plain; charset="UTF-8"

This is something that should go into master, not the -stable branches.

We could do a backport if really required, but it does need to merge
to master first.

I assume it does also apply to master, but I'd like to hear your confirmation.

Bruce


On Fri, Oct 12, 2018 at 12:58 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> ptest puts the test status at the beginning of the test. Follow
> the style.
>
> BEGIN: /usr/lib/lxc/ptest
>  ### Starting LXC ptest ###
> SKIPPED: lxc-test-apparmor
> FAIL: lxc-test-attach
> PASS: lxc-test-automount
> FAIL: lxc-test-autostart
> PASS: lxc-test-cgpath
> PASS: lxc-test-cloneconfig
> PASS: lxc-test-clonetest
> PASS: lxc-test-concurrent
> FAIL: lxc-test-console
> PASS: lxc-test-containertests
> PASS: lxc-test-createconfig
> FAIL: lxc-test-createtest
> FAIL: lxc-test-destroytest
> PASS: lxc-test-device-add-remove
> PASS: lxc-test-get_item
> PASS: lxc-test-getkeys
> PASS: lxc-test-list
> PASS: lxc-test-locktests
> PASS: lxc-test-lxcpath
> PASS: lxc-test-may-control
> PASS: lxc-test-reboot
> PASS: lxc-test-saveconfig
> SKIPPED: lxc-test-shutdowntest
> PASS: lxc-test-snapshot
> PASS: lxc-test-startone
> PASS: lxc-test-utils
>
> Results:
>     PASSED = 19
>     FAILED = 5
>     SKIPPED = 2
> (for details check individual test log in ./logs directory)
>
>  ### LXC ptest complete ###
> END: /usr/lib/lxc/ptest
>
> Signed-off-by: Sinan Kaya <okaya@kernel.org>
> ---
>  recipes-containers/lxc/files/run-ptest | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-containers/lxc/files/run-ptest b/recipes-containers/lxc/files/run-ptest
> index e98554497..3f3a75f25 100644
> --- a/recipes-containers/lxc/files/run-ptest
> +++ b/recipes-containers/lxc/files/run-ptest
> @@ -29,17 +29,17 @@ do
>      then
>         $test >logs/$(basename $test).log 2>&1
>      else
> -       echo "$test SKIPPED"
> +       echo "SKIPPED: $(basename $test)"
>         skipped=$((skipped+1))
>         continue
>      fi
>
>      if [ $? -eq 0 ]
>      then
> -       echo "$test PASS"
> +       echo "PASS: $(basename $test)"
>         passed=$((passed+1))
>      else
> -       echo "$test FAIL"
> +       echo "FAIL: $(basename $test)"
>         failed=$((failed+1))
>      fi
>  done
> --
> 2.19.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 835D6E00D07; Mon, 18 Mar 2019 20:38:47 -0700 (PDT)
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
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.42 listed in list.dnswl.org]
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
	[209.85.167.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 11B1CE00C4D
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Mar 2019 20:38:46 -0700 (PDT)
Received: by mail-lf1-f42.google.com with SMTP id u9so13198604lfe.11
	for <meta-virtualization@yoctoproject.org>;
	Mon, 18 Mar 2019 20:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=B5Q4OiujXNv2O7YRCfZx3ezxH4sB5gFsVDLjqRDg+as=;
	b=f3Rdm/A+qDeUIyOn7YntfsV7NobcbDt/26MN5wQ2KsjNdJ0QV/3j0dMMRsplPBDGf4
	gbHLeM8bThqDDW4fJGNH9i09NQVOCbrWDIo/Qw7+5NSLnFQQJR+pNNgGFxdbTg8TmJPs
	Lz8IsuiRe8694VIRrVEHTDil9bSrPNeBPAKq9a9/18KDY/P742C/wcHtNiun2BCYFnJr
	F+HgfSV34loZpCE0U0GEtBwJKas1JapPuxPQcjH+tDg02WQDnRdigL0divmP4xWB6pMe
	KauY4LxqFmYMQC5CLISeBbZZLQtsxiv26Wr491g3UCaz3RvUe9QFq/9cC0kZT/61bHdX
	+KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=B5Q4OiujXNv2O7YRCfZx3ezxH4sB5gFsVDLjqRDg+as=;
	b=ZPbKcuMLFVhmN3V5pPSnlakv3AHiWypAyaH5Gh6q1PjpeDycpsTZpubE2FlZXHbijb
	7yI/lXmInO6JOBnimEemaScJ/K3ennuUqKrR2d0eaioBLKXzMK8m4NuXJ0zDmSG7E071
	gJimCvCM3tsM0sZrY8NSFPn3MySY/vOYlL7PWmZaJrIWD3h2i45hmfXbrcQzSLXMP5v+
	5DpX1OfcyQATOOcb9euRBJthWgDKgVhtts1mEBch7yNR0YIOl4e7MbsAYcmGMwpaGKzm
	lAGRRZPlixwoH+WCEaYY1eURhFO9n0uhXWOMwNGFq2CXOJdXFveNXOnbeTnU0HbsLajB
	osKw==
X-Gm-Message-State: APjAAAVrOw6ASDrgnIZ51xz8HOQftM1P+mfbwZUo1noDeYLPRs2T8S0J
	QH9Zze+I9XobUMHeZgRbIdLjRYTctbYXD3y2d7l1M94N
X-Google-Smtp-Source: APXvYqwxjSUjgPITHbPKfF8A7ACAMbsWzgEJY+XCpf/aw1YYv6QQoG3mLPRIXgja+pEPqYZRpUZiVfeut30Mu6pPdhM=
X-Received: by 2002:a19:7914:: with SMTP id u20mr12208549lfc.41.1552966725233; 
	Mon, 18 Mar 2019 20:38:45 -0700 (PDT)
MIME-Version: 1.0
References: <3b4cc4ec-fd4f-83a6-b019-5300f302fadc@windriver.com>
In-Reply-To: <3b4cc4ec-fd4f-83a6-b019-5300f302fadc@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 18 Mar 2019 23:38:33 -0400
Message-ID: <CADkTA4Ows5JiVxF_dWwoNNj=ZBLq9Rij6Dm81uE63TtrDpKW6g@mail.gmail.com>
To: "Hongzhi, Song" <hongzhi.song@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: Ask for if can I remove notary recipe under recipes-devtools/go/
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
X-List-Received-Date: Tue, 19 Mar 2019 03:38:47 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 11:33 PM Hongzhi, Song
<hongzhi.song@windriver.com> wrote:
>
> Hi all,
>
> Based on updated strategy around GO (source) dependencies that dependencies
>
> have been populated to package-self vendor directory. So some unused
> recipe can
>
> be dropped.
>
>
> I think notary recipe is one of unused recipe. I find it is only
> depended by docker now.
>
> But docker has include notary under itself vendor directory. So I think
> notary recipe can
>
> be dropped.
>
>
> Maybe I miss other dependency relationships. So I want make sure that if
> notary can be

There's a lot of different ways to build docker due to the moby-docker
and docker-ce, combinations. So for now, we'd be safer to keep it
around a bit longer and have another look at it in the fall.

Bruce

>
> dropped.
>
>
> Thanks,
>
> Hongzhi
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


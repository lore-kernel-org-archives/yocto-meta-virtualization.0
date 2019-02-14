Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 53521E00BAF; Thu, 14 Feb 2019 06:08:24 -0800 (PST)
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
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B981AE00B81
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:08:22 -0800 (PST)
Received: by mail-lj1-f196.google.com with SMTP id q128so5313423ljb.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 14 Feb 2019 06:08:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Ty4JTYaySui62b4yQbmzDVamPVyM42o6rAgyC9mjYmc=;
	b=CWbJbJpw0Xi/XsSYLmz/sTAVIct03NptlAxhEGP8iNsiJbpf+l27heGiPZJOobIciF
	EniSrFGpj/i4r+ARRLSMMceOZVJl4/+hAcnO3wwXMoBNfa+/lqdQYI6tciBmIDeuKCpI
	rlD+txZxyxt9BXi0AwlqBOV8gv0dysgM61e+oH9eHQSiz//6TzHzbzv63nSoO8W0Dfbz
	jAMURKQoNnpRIhiRquX3jiZw2diYsUUO+ZmWRWyUVg7C8MzavbRHnwmMQDF9Y5TJLiYZ
	NGFTKTmLBR0R++uzK/Ujm1gWw+AE5tKGEZ5LZoQDAgynn9eA6VkDU5dHBCH058MvpOas
	xKZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Ty4JTYaySui62b4yQbmzDVamPVyM42o6rAgyC9mjYmc=;
	b=VznaooaPbsQJj361tiLMEqyQhFsjinS5/LleeFalrFV5CXzRfvYCa52dJaNmJ/fIsv
	V2lqdGfVzWMYeVsvYgGVI4VLh9bSViV2G2UzaiwqJoCJbjjZZs1DhSXsbw0bITX8pPoq
	VWUF7jxChVhg2dMpktJ8KGTjtIKmDP+qNvX38V4f8652CpnVdBsdjT5V4HshZgq3j6Ar
	CruiTGI5TQFXE8zxg0/PSPHh0qZ+6cHjI15qXrq4g9C1g6Y2RL73xpc6bpvXaYcOdLUZ
	qVPkiSjyhihAhkt6Ipj8e9s41helwgD3F+AtZW1B9BSaWlx6XyennOurSmC43IODm39V
	K6WQ==
X-Gm-Message-State: AHQUAuaaeGS0TwQCoFyVEmNqOsmc1toGu+bg5yEdjbh+x6Igk+wvIVm3
	V27eDDAMnBrBMCGw5R4KX6QdYdFxq1FfZBHh5QU=
X-Google-Smtp-Source: AHgI3IaG8sJBnYef4jioUkqTLUQqVEljC0rKdq8Vn3em3PXQ+p2Zl75l+LJS50aKdCRpSJFiY0NM8Olppj4+e0T2mAk=
X-Received: by 2002:a2e:4784:: with SMTP id
	u126-v6mr2530956lja.124.1550153301462; 
	Thu, 14 Feb 2019 06:08:21 -0800 (PST)
MIME-Version: 1.0
References: <1550115380-20107-1-git-send-email-dengke.du@windriver.com>
In-Reply-To: <1550115380-20107-1-git-send-email-dengke.du@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 14 Feb 2019 09:08:09 -0500
Message-ID: <CADkTA4OhDFnmcCSnOWDryCmfKVa+OS2W479hW=8bPYia3qsfsQ@mail.gmail.com>
To: Dengke Du <dengke.du@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: disable ccache
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
X-List-Received-Date: Thu, 14 Feb 2019 14:08:24 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Feb 13, 2019 at 10:18 PM Dengke Du <dengke.du@windriver.com> wrote:
>
> When enable ccache for ceph, error occurs:
> -----------------------------------------------------
>     ccache: invalid option -- 'E'
>     ...
>     Unable to determine C++ standard library, got .
> -----------------------------------------------------
> This is because variable "CXX_STDLIB" was null in CMakeLists.txt line: 637,
> The "CXX_STDLIB" come from:
> -----------------------------------------------------
>     execute_process(
>       COMMAND ./librarytest.sh ${CMAKE_CXX_COMPILER} ${CMAKE_CXX_FLAGS}
>       WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
>       OUTPUT_VARIABLE CXX_STDLIB
>       )
> -----------------------------------------------------
> The script librarytest.sh in ceph accept argument: compile and flags, but when
> enable ccache, the compile replace by ccache, so that script failed.
>
> So we disable ccache for ceph now.
>
> Signed-off-by: Dengke Du <dengke.du@windriver.com>
> ---
>  recipes-extended/ceph/ceph_13.2.2.bb | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/recipes-extended/ceph/ceph_13.2.2.bb b/recipes-extended/ceph/ceph_13.2.2.bb
> index 08021cf..0cba08a 100644
> --- a/recipes-extended/ceph/ceph_13.2.2.bb
> +++ b/recipes-extended/ceph/ceph_13.2.2.bb
> @@ -101,3 +101,4 @@ PACKAGES += " \
>  "
>  INSANE_SKIP_${PN}-python += "ldflags"
>  INSANE_SKIP_${PN} += "dev-so"
> +CCACHE_DISABLE = "1"
> --
> 2.7.4
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


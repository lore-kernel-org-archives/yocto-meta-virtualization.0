Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CC922E00C1E; Wed, 20 Mar 2019 11:41:17 -0700 (PDT)
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
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.167.48 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
	[209.85.167.48])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id A86D0E00BB7
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:41:16 -0700 (PDT)
Received: by mail-lf1-f48.google.com with SMTP id u21so2708725lfu.2
	for <meta-virtualization@yoctoproject.org>;
	Wed, 20 Mar 2019 11:41:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=XbfhnSAiHyVoOE3UpFa/bBG3UfuayNTwMSsNavMZmRA=;
	b=EQ+rX+lIOZIYv1wNngNOsGsaJ6qj1ghzfzdav9aZvcWUXwQkVUsC21f6zLHFUkHjyn
	rBc0zwJyAO4PGoxAduMBuAq+GXkCF8ZO44F1kNKGmbXTjUl4wyNA/djl/fDq02SDMHHL
	v1EDDLi2wE+oLMukCAn9yyEooForIzRJQXqzpNFKfeSgvU3N/RlossieC9K6B+NywWMY
	nExhB13xlLgfcmFT6/09nZPe64YHWVp3xYX8lnhoUEL4ZEo+RJoopW7iSs8jU8RENSuE
	MZp0/wmOs5G5yz/m/4SskiCOlnJYKuedUT016H4wbX1lvURgMRYnChpoQPx1fu9CIBac
	7sYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=XbfhnSAiHyVoOE3UpFa/bBG3UfuayNTwMSsNavMZmRA=;
	b=S3RRhHG7M9KmyA0DZwfuyELQEmLvcv1cnJMXSDegyAilcO9b9yuwTUL84jMsnh1PQp
	RTAl9AveOit7USAEIodCrun3oBXCkiZ32VLjrQ38RYD88fSLbO79OShMAl+Tj4zVeaBk
	4TdITF9v0kKTqpaPVVX3rTcefHEcNln1vPayqhWrfmU1TW2iWbizZaJ1OGVr73GkrnLA
	pC4hiE2U8sJhNqo1XIL1w+t/c9iODbp6cJfDdAdztl3O4wBg9kLLv4Xmn7qecTyscKbr
	PK8mXbtM2lTBN+ZZP6Qst3n8mFewJmMyzn/YjJP6gnj1fsGY5LT/FDg/v0nZOjLfmO9k
	q0jw==
X-Gm-Message-State: APjAAAUGRPgksCyHWD96LAFBRgeMdXBxYJV7XzhEHzHXONCkXE0tEnJo
	0KbUzs940Iw+ev5MBFSHEwcB0TeUxqLD9m9H6OM=
X-Google-Smtp-Source: APXvYqwT5smO233T2Bj3nE76lTcRhHnoogeiQ2VQOB5Uupba7b0baZ6QW2k0GEq2AutDlkLbcJ3Hsz9FeynWn7Tpfuo=
X-Received: by 2002:a19:968c:: with SMTP id
	y134mr10056408lfd.140.1553107274232; 
	Wed, 20 Mar 2019 11:41:14 -0700 (PDT)
MIME-Version: 1.0
References: <1552934935-27182-1-git-send-email-mark.asselstine@windriver.com>
In-Reply-To: <1552934935-27182-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 20 Mar 2019 14:41:03 -0400
Message-ID: <CADkTA4NyX2eudyTjHdrKKhPSD3S8WHeSLNj6ufjnwhj2URescw@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org, Paul Barker <pbarker@toganlabs.com>
Subject: Re: [PATCH] netns: change build target to 'build' instead of 'static'
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
X-List-Received-Date: Wed, 20 Mar 2019 18:41:17 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 18, 2019 at 2:48 PM Mark Asselstine
<mark.asselstine@windriver.com> wrote:
>
> Attempting to build for x86-64 will result in an error:
>    cannot find package runtime/cgo (using -importcfg)
>    ...go/pkg/tool/linux_amd64/link: cannot open file : open : no such file or directory
>
> As a workaround we switch the build target to 'build' which results in
> a slightly smaller executable but does mean that several dynamic
> libraries are required to run the generated executable. This shouldn't
> be a problem as the build system will ensure the libraries are present
> on images where the executable will be included. This change only
> means the executable can't be copied as a single entity to a different
> machine and run.
>
> We do also patch the Makefile to allow the 'static' target to build
> successfully and in the patch commit log we describe the issue in full
> (at least in as much detail as we currently have on the issue). But
> since the issue isn't fully understood we don't recommend the 'static'
> build to be used at this time, thus default to the 'build' target.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>
> Bruce, Paul,
>
> Just a few notes on this.
> * Do I understand what is going on in full, no. The behavior is
>   matching what was described in earlier version of GO but I don't
>   know why we are being affected when we should not be.
> * This brings up a question around GO recipes, we should most likely
>   be consistent in building fully static vs not. This should most
>   likely be addressed in the go.bbclass. A topic for further discussion.
> * Do I want to get to 100% understanding yes. But as you two have seen
>   there are other GO related changes/work that I have underway that
>   I want to get done to make building GO packages consistent. I have
>   a gut feeling that part of the issue here is related to a build
>   inconsistency so I want to rule that out before I dig in any further.
> * Related to the previous point, the reason I found this and the reason
>   I want a fix merged is to get me to a point where all GO packages in
>   meta-virtualization build correctly, so I can affect other changes and
>   cleanup accross all GO recipes knowing they are kept in a working
>   state.
>
> I do want to have this merged as we are going from a not working to a
> working state, freeing me up to tackle some needed GO cleanup, to
> address the consistency issues I mention above. That being said, I
> will definitely understand if you or others object to this change
> being merged.

I don't see any objections, so I've gone ahead and merged this. If it
causes us problems in the future, we can revisit it.

Bruce

>
>  ...orce-rebuilding-all-packages-to-avoid-cgo.patch | 54 ++++++++++++++++++++++
>  recipes-networking/netns/netns_git.bb              |  5 +-
>  2 files changed, 58 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
>
> diff --git a/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> new file mode 100644
> index 0000000..3b0c0a4
> --- /dev/null
> +++ b/recipes-networking/netns/files/Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch
> @@ -0,0 +1,54 @@
> +From 09524d187ef108784c854a0c247ac6476a10bb67 Mon Sep 17 00:00:00 2001
> +From: Mark Asselstine <mark.asselstine@windriver.com>
> +Date: Mon, 18 Mar 2019 14:04:16 -0400
> +Subject: [PATCH] Makefile: force rebuilding all packages to avoid cgo
> +
> +We are running into an issue when attempting to build 'static',
> +similar to what is described by
> +
> +https://plus.google.com/117192131596509381660/posts/eNnNePihYnK
> +and
> +https://github.com/golang/go/issues/9369
> +
> +In our case we can see that it manifests as a build error
> +
> +    cannot find package runtime/cgo (using -importcfg)
> +    ...go/pkg/tool/linux_amd64/link: cannot open file : open : no such file or directory
> +
> +Although the descriptions of issue indicate that newer versions of GO,
> +such as the version we are using, should not have this issue it is
> +clear from the error that cgo is being referenced when it should be
> +out of the picture.
> +
> +Interesting enough this issue only manifests when we are building on
> +x86-64 and building for x86-64 which might indicate that GO might be
> +finding -native packages and not -cross packages.
> +
> +This change works around the issue and will allow for the building of
> +the 'static' make target, but at this time and until the issue is
> +completely understood, it is recommended that the 'build' target is
> +used.
> +
> +Upstream-Status: Inappropriate [only an issue with our builds]
> +
> +Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> +---
> + Makefile | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/Makefile b/Makefile
> +index 476cb9b..ecd0df4 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -41,7 +41,7 @@ $(NAME): *.go VERSION.txt
> + .PHONY: static
> + static: ## Builds a static executable
> +       @echo "+ $@"
> +-      CGO_ENABLED=0 $(GO) build \
> ++      CGO_ENABLED=0 $(GO) build -a -pkgdir dontusecurrentpkgs \
> +                               -tags "$(BUILDTAGS) static_build" \
> +                               ${GO_LDFLAGS_STATIC} -o $(NAME) .
> +
> +--
> +2.7.4
> +
> diff --git a/recipes-networking/netns/netns_git.bb b/recipes-networking/netns/netns_git.bb
> index b6d3594..f5cdace 100644
> --- a/recipes-networking/netns/netns_git.bb
> +++ b/recipes-networking/netns/netns_git.bb
> @@ -5,6 +5,7 @@ LIC_FILES_CHKSUM = "file://src/import/LICENSE;md5=48ef0979a2bcc3fae14ff30b8a7f5d
>
>  SRC_URI = "git://github.com/genuinetools/netns;branch=master \
>             file://0001-Allow-selection-of-go-compiler.patch \
> +           file://Makefile-force-rebuilding-all-packages-to-avoid-cgo.patch \
>            "
>  SRCREV = "0da6ab0997707024debe68c91e940c9168041bf8"
>  PV = "0.4.0"
> @@ -42,7 +43,9 @@ do_compile() {
>         export CGO_LDFLAGS="${BUILDSDK_LDFLAGS} --sysroot=${STAGING_DIR_TARGET}"
>
>         cd ${S}/src/import
> -       oe_runmake static
> +       # Static builds work but are not recommended. See Makefile*cgo patch.
> +       #oe_runmake static
> +       oe_runmake build
>  }
>
>  do_install() {
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1236FE00BF8; Tue,  3 Sep 2019 10:40:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2D303E0074B
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 10:40:37 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id t14so16955377lji.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 10:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JOzUCALfOSNpi/qoq8gW3I2vsnZlrDuvbQVOZ+coQYA=;
	b=PDw9HY/I+9qJdBO3WDoaiJzBHazxnzOPXTG2/LOsJ0z8iFtP01wI/VDO6AqZtyUJkK
	MHL0TzLgZuQ2/iyf5f0ywZULNmexw114jHGI+2ePkhj8e78UUlGoZvvtllWVF1hDgryr
	lXBIRnfVcV3lC8P5EVyKvH3JFmafcrjTPO/7KRKhvtw3+F0S5lmvqj2srQz8ce9N+9Ez
	K0D3iJf/cirum2m57gx1qL9Tl9UCzWU23aPhuVENWJPiC7MwHBFgAXJTHEydid4uHwMm
	H8tJzyUGoIiYYLQM1Sk+ZP8FX0xoUSuxFK4CRf1JZ2vorA0ZLgoZaApiFsmHFzp0j87i
	32Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JOzUCALfOSNpi/qoq8gW3I2vsnZlrDuvbQVOZ+coQYA=;
	b=NqnvYc3nstJNx1JvADXs9vTVmJ+vrC2fZfwpBU8WMfliP2Kac3JEckEcOfVfq/+Pn1
	+20Fc/N3S1vPtFu5hUCLqkrSF9T3u00y3OcKXO6M5MoQ2pQgafnuyWLO9AC6YcTRCDMl
	n2DTUoILWUVt8XBzicyHQJtJ2W2TvfsFdzekIaU1VoTL0mvYg5/RC+JWKZQlDx7wh/LS
	f9fPExI1QRJs444ird+iloMOARBgGjDkNiOf7O3cqLrk74ddY44M+8WBXtpQlKm77Iet
	guQQWFnwAxxLjc7JXi7J0kOV/cFxTZwaYoIx8dffHoyoRj7sEDh/divVEOh2aKi8rF8H
	FEwA==
X-Gm-Message-State: APjAAAXTK+pWBeDqCmhZSa9/Ij/+EsqcanqlypAA0eQ7b7q8fPM+GiSo
	e+OE7d5S+4YaPG25tuCr/JHu5gi+MUawVgysNvjGd9iJ
X-Google-Smtp-Source: APXvYqwcz1BCyuqQ/0sDa+tHl/wAsTef55U/JJFF+0lLNIu+6iqh3TSFWgluxXKCrtNq1gqFeb/5DtrLoE39L1pUxA8=
X-Received: by 2002:a2e:b0e2:: with SMTP id h2mr2789092ljl.79.1567532436370;
	Tue, 03 Sep 2019 10:40:36 -0700 (PDT)
MIME-Version: 1.0
References: <1567497660-75506-1-git-send-email-hongxu.jia@windriver.com>
In-Reply-To: <1567497660-75506-1-git-send-email-hongxu.jia@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Sep 2019 13:40:25 -0400
Message-ID: <CADkTA4OWtpRXJV0bJAbt9xO4oCte0DVyiO55-GGh=fqPucU2nQ@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: Fix CVE-2019-14271 loading of nsswitch based config inside chroot under Glibc
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
X-List-Received-Date: Tue, 03 Sep 2019 17:40:40 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 3, 2019 at 4:02 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>
> Backport a patch from upstream to fix CVE-2019-14271

Given the docker version bumps that Stefan posted earlier, is this
still required ?

Bruce

>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  recipes-containers/docker/docker_git.bb            |  1 +
>  ...nss-libraries-in-Glibc-so-that-the-dynami.patch | 50 ++++++++++++++++++++++
>  2 files changed, 51 insertions(+)
>  create mode 100644 recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
>
> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
> index e45f87e..e993017 100644
> --- a/recipes-containers/docker/docker_git.bb
> +++ b/recipes-containers/docker/docker_git.bb
> @@ -45,6 +45,7 @@ SRC_URI = "\
>         file://docker.init \
>         file://0001-libnetwork-use-GO-instead-of-go.patch \
>         file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
> +       file://0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch \
>         "
>
>  require docker.inc
> diff --git a/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
> new file mode 100644
> index 0000000..67ddd49
> --- /dev/null
> +++ b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
> @@ -0,0 +1,50 @@
> +From b688546c8e35ce48d02dd5adf156399b37590b26 Mon Sep 17 00:00:00 2001
> +From: Justin Cormack <justin.cormack@docker.com>
> +Date: Thu, 25 Jul 2019 15:24:39 +0100
> +Subject: [PATCH] Initialize nss libraries in Glibc so that the dynamic
> + libraries are loaded in the host environment not in the chroot from untrusted
> + files.
> +
> +See also OpenVZ https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234
> +
> +Signed-off-by: Justin Cormack <justin.cormack@docker.com>
> +(cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8ebc236b)
> +Signed-off-by: Tibor Vass <tibor@docker.com>
> +
> +CVE: CVE-2019-14271
> +Upstream-Status: Backport [a316b10dab79d9298b02c7930958ed52e0ccf4e4]
> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> +---
> + src/import/pkg/chrootarchive/archive.go | 9 +++++++++
> + 1 file changed, 9 insertions(+)
> +
> +diff --git a/src/import/pkg/chrootarchive/archive.go b/src/import/pkg/chrootarchive/archive.go
> +index 6ff61e6..83ed0c6 100644
> +--- a/src/import/pkg/chrootarchive/archive.go
> ++++ b/src/import/pkg/chrootarchive/archive.go
> +@@ -4,13 +4,22 @@ import (
> +       "fmt"
> +       "io"
> +       "io/ioutil"
> ++      "net"
> +       "os"
> ++      "os/user"
> +       "path/filepath"
> +
> +       "github.com/docker/docker/pkg/archive"
> +       "github.com/docker/docker/pkg/idtools"
> + )
> +
> ++func init() {
> ++      // initialize nss libraries in Glibc so that the dynamic libraries are loaded in the host
> ++      // environment not in the chroot from untrusted files.
> ++      _, _ = user.Lookup("docker")
> ++      _, _ = net.LookupHost("localhost")
> ++}
> ++
> + // NewArchiver returns a new Archiver which uses chrootarchive.Untar
> + func NewArchiver(idMapping *idtools.IdentityMapping) *archive.Archiver {
> +       if idMapping == nil {
> +--
> +2.8.1
> +
> --
> 2.8.1
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


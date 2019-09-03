Return-Path: <akuster808@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7E298E00D68; Tue,  3 Sep 2019 11:28:47 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (akuster808[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.215.195 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pg1-f195.google.com (mail-pg1-f195.google.com
	[209.85.215.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 40B29E00BA1
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Sep 2019 11:28:46 -0700 (PDT)
Received: by mail-pg1-f195.google.com with SMTP id u72so5413432pgb.10
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Sep 2019 11:28:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=FrqQT0QyAmontsBAIkHibFuMNA+Qp9ElCVbys8ipfr0=;
	b=q+90OjTE0afHNMF7NmQ0cF/nPuyZuQGQi70MufzK7W+EancE/dVPkgkZI3skSj8/3t
	6tSKfdrqMaeAyrOhlSF7uGhMynTpwu8JQ79ewIuPR2XBblDBqL7b3JoXOu2UxRFn4hsg
	8mJBUJ4kDXaXrW6NtyqECuiSor6z/kDy+KwEiox++2buCGqRvbMy3v4MqCVaTxHeTClh
	igTIg7mCjVKLADxSRRLo8v19PLdvTKYZnMtclg/LadA2EFujLHuTiBq+B0iz/yRqEBJO
	X9WNTYSB3zgG08DETWVpMQCjGCU+a/JRv0WYFUAS7zwhdPJJJHIIKqO/y7ePcQhj3Ri7
	E2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=FrqQT0QyAmontsBAIkHibFuMNA+Qp9ElCVbys8ipfr0=;
	b=VV76MWOVAONrrcSAgJpUApRL1S/qnyVSjaDIXqwIGtFq1rdxuClrXmXdbKCZWbf7i3
	YI4PcwZacgSYNgfiY78NXH6u6+Iorqx+zi59g7AI25ZeRMudIja0J1NTDGDr4Fupfrpl
	2RCjApSXYS1zFpaV6efF4HzXP8PsSZZBesbMxqjrzcrtKPr4pbjL1YlMNkxgXFtBtOu2
	h5JZoR7V+MFe7t63HNUDbBElts9hGCaVmnGSAiK/9eXkFf6FwdJU0oMR6VyjCQq68GKE
	zLsz8Ry1huvjd9KZiJ3mNS2BW1CDd9cBFsZLGjUi8ilnIL+QdPGAfMzDNUP2wNdkvDCb
	0qUg==
X-Gm-Message-State: APjAAAWaRA6VGa6X0NdNvZKkYcxH2Y+kKynVePgi3CUFGxZM/MkpVIrk
	f819ExRaOIL8yuR4uDeQnAz/QIPn
X-Google-Smtp-Source: APXvYqzyKPQ7+HaUqIcThy4WeWHIes6qH5Spr0osr69LcDqm6en/kRYuQ0sxvevxs7FM9oq18+aWyQ==
X-Received: by 2002:aa7:8b0f:: with SMTP id f15mr42015653pfd.235.1567535325625;
	Tue, 03 Sep 2019 11:28:45 -0700 (PDT)
Received: from [10.20.245.11] ([45.19.219.178])
	by smtp.gmail.com with ESMTPSA id
	t9sm18929817pgj.89.2019.09.03.11.28.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 Sep 2019 11:28:45 -0700 (PDT)
To: Bruce Ashfield <bruce.ashfield@gmail.com>,
	Hongxu Jia <hongxu.jia@windriver.com>
References: <1567497660-75506-1-git-send-email-hongxu.jia@windriver.com>
	<CADkTA4OWtpRXJV0bJAbt9xO4oCte0DVyiO55-GGh=fqPucU2nQ@mail.gmail.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <47fbd63a-708b-cafa-b4c8-e73924be3156@gmail.com>
Date: Tue, 3 Sep 2019 11:28:44 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OWtpRXJV0bJAbt9xO4oCte0DVyiO55-GGh=fqPucU2nQ@mail.gmail.com>
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
X-List-Received-Date: Tue, 03 Sep 2019 18:28:47 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/3/19 10:40 AM, Bruce Ashfield wrote:
> On Tue, Sep 3, 2019 at 4:02 AM Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Backport a patch from upstream to fix CVE-2019-14271
> Given the docker version bumps that Stefan posted earlier, is this
> still required ?
What about stable branches? can this be reused for any of them?

- armin
>
> Bruce
>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> ---
>>  recipes-containers/docker/docker_git.bb            |  1 +
>>  ...nss-libraries-in-Glibc-so-that-the-dynami.patch | 50 ++++++++++++++++++++++
>>  2 files changed, 51 insertions(+)
>>  create mode 100644 recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
>>
>> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
>> index e45f87e..e993017 100644
>> --- a/recipes-containers/docker/docker_git.bb
>> +++ b/recipes-containers/docker/docker_git.bb
>> @@ -45,6 +45,7 @@ SRC_URI = "\
>>         file://docker.init \
>>         file://0001-libnetwork-use-GO-instead-of-go.patch \
>>         file://0001-imporve-hardcoded-CC-on-cross-compile.patch \
>> +       file://0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch \
>>         "
>>
>>  require docker.inc
>> diff --git a/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
>> new file mode 100644
>> index 0000000..67ddd49
>> --- /dev/null
>> +++ b/recipes-containers/docker/files/0001-Initialize-nss-libraries-in-Glibc-so-that-the-dynami.patch
>> @@ -0,0 +1,50 @@
>> +From b688546c8e35ce48d02dd5adf156399b37590b26 Mon Sep 17 00:00:00 2001
>> +From: Justin Cormack <justin.cormack@docker.com>
>> +Date: Thu, 25 Jul 2019 15:24:39 +0100
>> +Subject: [PATCH] Initialize nss libraries in Glibc so that the dynamic
>> + libraries are loaded in the host environment not in the chroot from untrusted
>> + files.
>> +
>> +See also OpenVZ https://github.com/kolyshkin/vzctl/blob/a3f732ef751998913fcf0a11b3e05236b51fd7e9/src/enter.c#L227-L234
>> +
>> +Signed-off-by: Justin Cormack <justin.cormack@docker.com>
>> +(cherry picked from commit cea6dca993c2b4cfa99b1e7a19ca134c8ebc236b)
>> +Signed-off-by: Tibor Vass <tibor@docker.com>
>> +
>> +CVE: CVE-2019-14271
>> +Upstream-Status: Backport [a316b10dab79d9298b02c7930958ed52e0ccf4e4]
>> +Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>> +---
>> + src/import/pkg/chrootarchive/archive.go | 9 +++++++++
>> + 1 file changed, 9 insertions(+)
>> +
>> +diff --git a/src/import/pkg/chrootarchive/archive.go b/src/import/pkg/chrootarchive/archive.go
>> +index 6ff61e6..83ed0c6 100644
>> +--- a/src/import/pkg/chrootarchive/archive.go
>> ++++ b/src/import/pkg/chrootarchive/archive.go
>> +@@ -4,13 +4,22 @@ import (
>> +       "fmt"
>> +       "io"
>> +       "io/ioutil"
>> ++      "net"
>> +       "os"
>> ++      "os/user"
>> +       "path/filepath"
>> +
>> +       "github.com/docker/docker/pkg/archive"
>> +       "github.com/docker/docker/pkg/idtools"
>> + )
>> +
>> ++func init() {
>> ++      // initialize nss libraries in Glibc so that the dynamic libraries are loaded in the host
>> ++      // environment not in the chroot from untrusted files.
>> ++      _, _ = user.Lookup("docker")
>> ++      _, _ = net.LookupHost("localhost")
>> ++}
>> ++
>> + // NewArchiver returns a new Archiver which uses chrootarchive.Untar
>> + func NewArchiver(idMapping *idtools.IdentityMapping) *archive.Archiver {
>> +       if idMapping == nil {
>> +--
>> +2.8.1
>> +
>> --
>> 2.8.1
>>
>



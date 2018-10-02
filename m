Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id ADC85E00994; Tue,  2 Oct 2018 11:42:38 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.219.196 listed in list.dnswl.org]
Received: from mail-yb1-f196.google.com (mail-yb1-f196.google.com
	[209.85.219.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78E06E0095C
	for <meta-virtualization@yoctoproject.org>;
	Tue,  2 Oct 2018 11:42:37 -0700 (PDT)
Received: by mail-yb1-f196.google.com with SMTP id 5-v6so1242594ybf.3
	for <meta-virtualization@yoctoproject.org>;
	Tue, 02 Oct 2018 11:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=11dvW7BGNuPB4h/xrX9DNLItVwuUdac7LFhjmdDeCEw=;
	b=OTkuLUgvRqWPJF1EeUUI5qqXDeXEU8gq8y0U2emKOlkGU+6WU7MGYjLP21w+CdaoLX
	HzliVv7E6FczOSQLvGHXQHxs8tuICUcwwGA408wCVTLoRO1PizXRX5vXj2bbLAYU14lk
	d5pCJ7BLH4p/e1tdOz8GEj4z6RLwjlLAPLEYR6FQ2wc03wpG21E9mAIAyxTJpsoWaJqB
	Y5PaMiwwYsl4iQD1Sjwhdlkv4C3yAJA12Gq1xrdENwFT2mRXeLWskdvNG83DgvVzEJ/w
	8BXBG4IGYZl/tqZReDb7HP61+2aGR+bTlokdn9KfTeugDFdzWYbRbyKG2m+Xh/iBfyw4
	k/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=11dvW7BGNuPB4h/xrX9DNLItVwuUdac7LFhjmdDeCEw=;
	b=b19SpdZmJ22vTeKCEDJSHoc0U2RWkRwsdd1oozX+JNacRRoJaUFbtRzeqINSpuoVFI
	zYnreHLwoUVDXeJGmpiWIjWfVwR3eRbEkJQOkpuvMRpfuA4OoZC70diGZmFLkccWNdna
	erJfKcam8DwSqwFjnuk3mbNdste2ani9w7vBs7KWNcRu7BvyUL8JG8DPCCcScZz3/JCq
	3vFWrO06OVVK+QXzfeTs9BwQwTu17rpZ0VeXcT+mGU3amQbx8/snqU86YqSG2Talw6I7
	yxXLGgHRXkHalfQ0wUl2pnCC/8hSkXg2BsryMuutPbUF4MDhG5K305GRte0ZyVPSHsGV
	FJGg==
X-Gm-Message-State: ABuFfohHFT4RFGnyA0+L24yalBsNue7OI2D8F5/EqqYDrY50Fwk4g3jN
	QwPglD9Qi7rx1C+w/tvzelAdHVVjjrc2GuxjdeyP8g==
X-Google-Smtp-Source: ACcGV60CsvqqOIETGeKaYXTxsPtlfvz5F2DhHcRmMnJufEFMl5Pdwc9KQNnuZWM5seETmZ2T50kWSvrKsDHyGkYNxVc=
X-Received: by 2002:a25:8b88:: with SMTP id
	j8-v6mr9781529ybl.183.1538505756618; 
	Tue, 02 Oct 2018 11:42:36 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 2002:a25:be8b:0:0:0:0:0 with HTTP;
	Tue, 2 Oct 2018 11:42:36 -0700 (PDT)
In-Reply-To: <CADkTA4MVaJzEcerxbocVh8hqon96dYsSXf3sZ4tN-iaHoFETwg@mail.gmail.com>
References: <1538277461-163634-1-git-send-email-changqing.li@windriver.com>
	<1538277461-163634-3-git-send-email-changqing.li@windriver.com>
	<CADkTA4MVaJzEcerxbocVh8hqon96dYsSXf3sZ4tN-iaHoFETwg@mail.gmail.com>
From: "M. Asselstine" <asselsm@mcmaster.ca>
Date: Tue, 2 Oct 2018 14:42:36 -0400
X-Google-Sender-Auth: nUyLMx5kTHUTjs1jiEpM7I4bU9w
Message-ID: <CAPuovEJts1fzd1NLO+rZp+6cDMv+yGVe37w1C9puBM=vUC00Hg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] docker: fix package qa warning
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
X-List-Received-Date: Tue, 02 Oct 2018 18:42:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 30, 2018 at 9:23 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> On Sat, Sep 29, 2018 at 11:18 PM <changqing.li@windriver.com> wrote:
>>
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> fix below warning:
>> do_package_qa: QA Issue: ELF binary 'xxx/usr/bin/docker'
>> has relocations in .text [textrel]
>>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>  recipes-containers/docker/docker_git.bb            |  1 +
>>  .../files/0001-fix-do_package_qa-error.patch       | 31 ++++++++++++++++++++++
>>  2 files changed, 32 insertions(+)
>>  create mode 100644 recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
>>
>> diff --git a/recipes-containers/docker/docker_git.bb b/recipes-containers/docker/docker_git.bb
>> index 73e0120..1a8d1a6 100644
>> --- a/recipes-containers/docker/docker_git.bb
>> +++ b/recipes-containers/docker/docker_git.bb
>> @@ -28,6 +28,7 @@ SRC_URI = "\
>>         file://docker.init \
>>         file://hi.Dockerfile \
>>          file://0001-libnetwork-use-GO-instead-of-go.patch \
>> +        file://0001-fix-do_package_qa-error.patch \
>>         "
>>
>>  # Apache-2.0 for docker
>> diff --git a/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch b/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
>> new file mode 100644
>> index 0000000..79e71a5
>> --- /dev/null
>> +++ b/recipes-containers/docker/files/0001-fix-do_package_qa-error.patch
>> @@ -0,0 +1,31 @@
>> +From 56c865e2a7269d63f0780b4cd1ed6fdb18e3ff1b Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Wed, 26 Sep 2018 17:41:59 +0800
>> +Subject: [PATCH] fix do_package_qa error
>> +
>> +fix below error:
>> +do_package_qa: QA Issue: ELF binary 'xxx/usr/bin/docker'
>> +has relocations in .text [textrel]
>> +
>> +Upstream-Status: Inappropriate [oe-specific]
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + cli/scripts/build/dynbinary | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/cli/scripts/build/dynbinary b/cli/scripts/build/dynbinary
>> +index 3c32ed3..938e086 100755
>> +--- a/cli/scripts/build/dynbinary
>> ++++ b/cli/scripts/build/dynbinary
>> +@@ -9,6 +9,6 @@ source ./scripts/build/.variables
>> +
>> + echo "Building dynamically linked $TARGET"
>> + export CGO_ENABLED=1
>> +-go build -o "${TARGET}" -tags pkcs11 --ldflags "${LDFLAGS}" "${SOURCE}"
>> ++go build -o "${TARGET}" -tags pkcs11 --ldflags "${LDFLAGS}" -buildmode=pie "${SOURCE}"
>
> As I mentioned in my other replies, I've never seen these warnings
> myself. So I need to understand the configuration better.
>
> Since I've never seen this before, my first reaction is that any
> change of the flags to include buildmode=pie needs to be conditional
> on some other distro feature that is enabled in your configuration.

Most likely the security flags at play. Could also be that you don't
have the check enabled. At any rate I agree the details need to be
captured in the commit log.

MarkA

>
> Bruce
>
>> +
>> + ln -sf "$(basename "${TARGET}")" build/docker
>> +--
>> +2.7.4
>> +
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end"
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization


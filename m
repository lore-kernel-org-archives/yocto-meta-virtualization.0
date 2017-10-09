Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 65C33E00C7B; Mon,  9 Oct 2017 16:02:06 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.216.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.216.195 listed in dnsbl.sorbs.net]
Received: from mail-qt0-f195.google.com (mail-qt0-f195.google.com
	[209.85.216.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3F042E00C7B
	for <meta-virtualization@yoctoproject.org>;
	Mon,  9 Oct 2017 16:02:04 -0700 (PDT)
Received: by mail-qt0-f195.google.com with SMTP id x54so13975996qth.0
	for <meta-virtualization@yoctoproject.org>;
	Mon, 09 Oct 2017 16:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WoK3ksJE4H1wLwT3rjbnaQee5JRgHw5PekCgEw4bjOE=;
	b=KQ/PrGoWaDMkhPn3TAtNaSwN7neAdioLu0pfC5EQJE+Mq11WVyKzOkstBIAADXENuE
	2OQiZ7geF7XLIDUycgMvGMI+3ebWQ1pM8Xbd5DLXdLjxWsCO9K5Ivc/WwTjJHYM7BFFk
	B3WlnJMHsavwhXHn4XXuctPBePPB/4s0MnK5M/eKnqp0bp9wtogFwGbW60JdTqefIg3U
	Ybbt1cmfH/SHGRD3MCuBhsxJsV7m/v9NLHaOx8gplp8Rbe2gV7Z/7K/VlyPQ7J3RVKnN
	+Qxj/oxCb/LW87+ejSzVyBsXHJDFQrC93NTG7vmu0mM6ptVWXBoiTsBOJ8JlpTY0W2EJ
	sWrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WoK3ksJE4H1wLwT3rjbnaQee5JRgHw5PekCgEw4bjOE=;
	b=YvuH3lPOK3uwE/m+d5R7tGQDK8nsn2ZVE2/Zcd3tRl7H5QixKmeFDMX2Gv4NcuZbVB
	o2jAXNMkhHtBL6BxHl3FgaLo9TNK1fOhTceruI7RDaS/7Gd9zwWFlC2Y1fEyuVx/wQUK
	TO3g6oFlC+5dGTP73GvifiRDOutYmQOmog3PG8pOemG9oacOSVNfaInwVBvrF8A/zdfk
	zn6HvOzcm2E3ZByoM0TiPllwQfcAudazU0qvOTKabv/c6AVxET2/G1Z+lfOOjzZe81Q8
	QH8LFrEJIZO584M52wZT53U+3hTc/EPLacEEvxKCRSTRVzgAbtqaApQa8tMzwoZkoiB4
	+Cow==
X-Gm-Message-State: AMCzsaUd4/rtLSrU6v4NZkHCbDypcU+Y6v9LVa+wpIi8PHDSfH8IxuZf
	fkU+3JFyPF0boeWzizGI72NoNS17hCaH7kQ+hz0=
X-Google-Smtp-Source: AOwi7QCXBj1I/ZDBn1EB8BWIYFXcdh+TrQoiChX1yZMyCgXqYVa2nTDffEsZlJzvvmTLyeT4W8UmIBElmW5Knefi/CY=
X-Received: by 10.55.159.4 with SMTP id i4mr11750768qke.339.1507590124072;
	Mon, 09 Oct 2017 16:02:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.12.215.197 with HTTP; Mon, 9 Oct 2017 16:02:03 -0700 (PDT)
In-Reply-To: <CAPyrkgxJLawo+vREn_HoV9FjLX6s4gz0+2952A75uCmhur+nwg@mail.gmail.com>
References: <20171009195421.17393-1-limon.anibal@gmail.com>
	<CAPyrkgxJLawo+vREn_HoV9FjLX6s4gz0+2952A75uCmhur+nwg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 9 Oct 2017 19:02:03 -0400
Message-ID: <CADkTA4Mxe=+hQjSmWGCzC97ftaM=52dsMxyevowELySZTaNg4g@mail.gmail.com>
To: Paul Barker <pbarker@toganlabs.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>,
	=?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linaro.org>
Subject: Re: [PATCH] Revert "runc: Don't override GOARCH or GOROOT"
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
X-List-Received-Date: Mon, 09 Oct 2017 23:02:06 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 9, 2017 at 5:56 PM, Paul Barker <pbarker@toganlabs.com> wrote:
> On Mon, Oct 9, 2017 at 8:54 PM, An=C3=ADbal Lim=C3=B3n <limon.anibal@gmai=
l.com> wrote:
>> From: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>>
>> This reverts commit fdee07aadc1b5224a540c7e8893144207e1979cb.
>>
>> Causes build failures when is cross-compiling to aarch64,
>>
>> | CGO_ENABLED=3D1 aarch64-linaro-linux-go build -i  -tags " cgo static_b=
uild" -ldflags "-w -extldflags -static -X main.gitCommit=3D"9d6821d1b53908e=
249487741eccd567249ca1d99-dirty" -X main.version=3D1.0.0-rc3 " -o runc .
>> ...
>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/a=
arch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nati=
ve/usr/lib/aarch64-linaro-linux/go/pkg/tool/linux_amd64/link: running aarch=
64-linaro-linux-gcc failed: exit status 1
>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/a=
arch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nati=
ve/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarc=
h64-linaro-linux/7.1.1/ld: cannot find crt1.o: No such file or directory
>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/a=
arch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nati=
ve/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarc=
h64-linaro-linux/7.1.1/ld: cannot find crti.o: No such file or directory
>> | /home/anibal.limon/linaro/oe-rpb-master/build-rpb/tmp-rpb-glibc/work/a=
arch64-linaro-linux/runc-docker/1.0.0-rc3+gitINVALID-r0/recipe-sysroot-nati=
ve/usr/bin/aarch64-linaro-linux/../../libexec/aarch64-linaro-linux/gcc/aarc=
h64-linaro-linux/7.1.1/ld: cannot find crtbeginT.o: No such file or directo=
ry
>> ...
>>
>> Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
>> ---
>>  recipes-containers/runc/runc.inc | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/recipes-containers/runc/runc.inc b/recipes-containers/runc/=
runc.inc
>> index b1f2ba8..83d5f86 100644
>> --- a/recipes-containers/runc/runc.inc
>> +++ b/recipes-containers/runc/runc.inc
>> @@ -21,6 +21,8 @@ EXTRA_OEMAKE=3D"BUILDTAGS=3D''"
>>  inherit goarch
>>
>>  do_compile() {
>> +       export GOARCH=3D"${TARGET_GOARCH}"
>> +       export GOROOT=3D"${STAGING_LIBDIR_NATIVE}/${TARGET_SYS}/go"
>>         # Set GOPATH. See 'PACKAGERS.md'. Don't rely on
>>         # docker to download its dependencies but rather
>>         # use dependencies packaged independently.
>> @@ -32,6 +34,7 @@ do_compile() {
>>
>>         (cd .gopath/src/${dname}; ln -sf ../../../../../${bname} ${bname=
})
>>         export GOPATH=3D"${S}/src/import/.gopath:${S}/src/import/vendor:=
${STAGING_DIR_TARGET}/${prefix}/local/go"
>> +       export GOROOT=3D"${STAGING_DIR_NATIVE}/${nonarch_libdir}/${HOST_=
SYS}/go"
>>
>>         # Fix up symlink for go-cross compiler
>>         rm -f ${S}/src/import/vendor/src
>
> It seems like we have conflicting changes :( Reverting this patch will
> break cross-compilation of runc-opencontainers for x86-64 with musl
> libc again.
>
> I'll try cross-compiling both runc variants for arm, aarch64, x86 and
> x86-64 and see if I can find a solution that works for everything.
>

Agreed.

I'll hold off on any revert until I hear from your tests.

For the configs I'm using everything is building with the current set
of changes.

Bruce

> --
> Paul Barker
> Tog=C3=A1n Labs Ltd



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


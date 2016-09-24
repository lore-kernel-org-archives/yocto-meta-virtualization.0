Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6674AE00D71; Fri, 23 Sep 2016 19:15:45 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.220.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.220.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1533E00D6A
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Sep 2016 19:15:43 -0700 (PDT)
Received: by mail-qk0-f194.google.com with SMTP id m184so214492qkb.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 23 Sep 2016 19:15:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=0AHnKHAkrF1L6BrMiVq87yhS9ZBCaJ8LX/nuUGorA9o=;
	b=itLo2DhXJ8TzoPd4xrzKxsE02hMqxPAU8EwQZsSITUJp1xTfUJ9Mf2mA/Ai7noAbh9
	vbFIWaEP0eoZ03ERvHzHfDEgjBB5MXdBUnFT7CPsWz6nA0KCq3o2fgQHtCIYYIjYUfIx
	R7yX7XMHNW4JEzp1pPA8ChEog5F5EXiILfoS5j+fgLQRKaOPwioNyUIXPpFT/k0h6ZWs
	1UWNg8mZeldtTdwRkLZtuwNDrsFOBoTlGJJQ0ieioKlBklgUYiQJgsGTf0G4Ycc3z30c
	NIrQ7IOBaBJ+5Dn3waNkpJ8uSXU775APJD4SeR5/js9FmK+LupETyNCJ7SWcgCHDKPDx
	QDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=0AHnKHAkrF1L6BrMiVq87yhS9ZBCaJ8LX/nuUGorA9o=;
	b=Sb4Zw1YgtDhm/9b3p0Er2c3Et9oeJtEEx9ziWvbfwDn8n73PvBqffnWu34HU332C2w
	QpZfDwtCjb4AZ19/ElhNwQObx3VfOMFL7hGoKsCuq58ut5Fq4dlgi5cXKlb3x9o54r0w
	GMXdl9BrNFGmcm0f1RgAdMdvsK5x4Ey/IdekJglRDwed5yczvhvAtNjpogroEaragGNV
	uE02iZSX8Z5V95ifOaDjFa5+ONWHIyoqNGGuL9MrQEyNcD/LG7JufaQ/sgM+XPpdYc/K
	Uptwv09DhmGRxp+8tf6XUoB2+6gUC4E3PEnm6eVw33fSR1IoXYsbQnzIpU+/BMfUsz+e
	R4jw==
X-Gm-Message-State: AA6/9RnNE71taAJ4wfhVuXujxbyU2j9PlKF6NKawDCLEngugesrMet7G3C/XmSPTHH/tz/HAJTE6AwoBlwbAFw==
X-Received: by 10.55.182.4 with SMTP id g4mr10563763qkf.120.1474683342722;
	Fri, 23 Sep 2016 19:15:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.237.38.166 with HTTP; Fri, 23 Sep 2016 19:15:42 -0700 (PDT)
In-Reply-To: <CADkTA4MYuXvFcRkNedCKfnYe=Vzto9mMiWBgKFgM1fV_0O2m_w@mail.gmail.com>
References: <1474390872-43488-1-git-send-email-jason.wessel@windriver.com>
	<CADkTA4MYuXvFcRkNedCKfnYe=Vzto9mMiWBgKFgM1fV_0O2m_w@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 23 Sep 2016 22:15:42 -0400
Message-ID: <CADkTA4OS-ohCznCgikRO5bbnfjacZkjR2V5Wi63_CwGe=_memw@mail.gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [v2 PATCH] go-cross: Fix host contamination for x86_64 host to x86_64 target
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
X-List-Received-Date: Sat, 24 Sep 2016 02:15:45 -0000
Content-Type: multipart/alternative; boundary=94eb2c060cf0cc9c6b053d37784f

--94eb2c060cf0cc9c6b053d37784f
Content-Type: text/plain; charset=UTF-8

On Thu, Sep 22, 2016 at 10:04 AM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

> merged.
>
>
bad news. This broke the build of go-cross on my machines (and on others ..
which
is why I went to look into it).

Errors like this:

------------------------------

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.go-autogen:
line 23: /home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-pok

y-linux/go: No such file or directory

| ./hack/make.sh: line 221:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

| bundles/1.12.0-dev already exists. Removing.

|

| ./hack/make.sh: line 361:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

| ---> Making bundle: dynbinary (in bundles/1.12.0-dev/dynbinary)

| ./hack/make.sh: line 288:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.go-autogen:
line 23: /home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-pok

y-linux/go: No such file or directory

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary:
line 13:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-li

nux/go: No such file or directory

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary:
line 13:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary:
line 13:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary:
line 13:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary:
line 23:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

| Building: bundles/1.12.0-dev/dynbinary-client/docker-1.12.0-dev

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary:
line 51:
/home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go:
No such file or directory

------------------


and this:


---------------

Log data follows:

| DEBUG: Executing shell function do_compile

| NOTE: make -j 20 static

| ERROR: oe_runmake failed

|
/home/bruce/poky/build/tmp/work/core2-64-poky-linux/containerd/0.2.2+git0ac3cd1be170d180b2baed755e8f0da547ceb267-r0/git

| cd ctr && go build -ldflags "-w -extldflags -static -X
github.com/docker/containerd.GitCommit=0ac3cd1be170d180b2baed755e8f0da547ceb267
" -tags "" -o ../bin/ctr

| cd containerd && go build -ldflags "-w -extldflags -static -X
github.com/docker/containerd.GitCommit=0ac3cd1be170d180b2baed755e8f0da547ceb267
" -tags "" -o ../bin/containerd

| cd containerd-shim && go build -ldflags "-w -extldflags -static -X
github.com/docker/containerd.GitCommit=0ac3cd1be170d180b2baed755e8f0da547ceb267
" -tags "" -o ../bin/containerd-shim

| # github.com/docker/docker/pkg/term

| cannot load DWARF output from $WORK/
github.com/docker/docker/pkg/term/_obj//_cgo_.o: decoding dwarf section
info at offset 0x4: unsupported version 0

| make: *** [shim-static] Error 2

| make: *** Waiting for unfinished jobs....

| # github.com/docker/docker/pkg/term

| cannot load DWARF output from $WORK/
github.com/docker/docker/pkg/term/_obj//_cgo_.o: decoding dwarf section
info at offset 0x4: unsupported version 0

| # github.com/opencontainers/runc/libcontainer/system

| cannot load DWARF output from $WORK/
github.com/opencontainers/runc/libcontainer/system/_obj//_cgo_

-------------------------------------------

In the spirit of keeping things buildable for the most part, I reverted the
change and we can have another look at this.


Bruce


> Bruce
>
> On Tue, Sep 20, 2016 at 1:01 PM, Jason Wessel <jason.wessel@windriver.com>
> wrote:
>
>> The go-cross package is explicitly for compiling target libraries on
>> the host system.  When the target architecture matches the host
>> architecture it will actually use the host's linker and compiler
>> however which can result in the generation of the cgo.a library having
>> linker symbols which might not work properly when compiling other
>> packages.
>>
>> A typical error looks like this when building consul-migrate:
>>
>> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/lib/x86_6
>> 4-linux/go/pkg/tool/linux_amd64/link: running x86_64-yocto-linux-gcc
>> failed: exit status 1
>> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x
>> 86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld:
>> /opt/build-intel-x86/tmp/work/core2-64-yocto-linux/consul-mi
>> grate/git-r0/build-tmp/go-link-956548052/000002.o: unrecognized
>> relocation (0x2a) in section `.text'
>> /opt/build-intel-x86/tmp/sysroots/x86_64-linux/usr/libexec/x
>> 86_64-yocto-linux/gcc/x86_64-yocto-linux/5.2.0/ld: final link failed:
>> Bad value
>> collect2: error: ld returned 1 exit status
>>
>> The fix is to use the make.bash --target-only option to properly build
>> the libraries with the target toolchain.
>>
>> When the host architecture does not match the target architecture we
>> must also force build the target libraries or they get dynamically
>> populated into the sysroot in an uncontrolled manner by the first
>> package that uses go-cross to compile code.
>>
>> Signed-off-by: Jason Wessel <jason.wessel@windriver.com>
>> ---
>>  recipes-devtools/go-cross/go-cross.inc | 10 +++++++++-
>>  1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/recipes-devtools/go-cross/go-cross.inc
>> b/recipes-devtools/go-cross/go-cross.inc
>> index 613e9c7..6363a78 100644
>> --- a/recipes-devtools/go-cross/go-cross.inc
>> +++ b/recipes-devtools/go-cross/go-cross.inc
>> @@ -2,6 +2,10 @@ inherit cross
>>
>>  DEPENDS += "go-native"
>>
>> +# Prevent runstrip from running because you get errors when the host
>> arch != target arch
>> +#INHIBIT_PACKAGE_STRIP = "1"
>> +STRIP = "echo"
>> +
>>  export GOHOSTOS = "${BUILD_GOOS}"
>>  export GOHOSTARCH = "${BUILD_GOARCH}"
>>  export GOOS = "${TARGET_GOOS}"
>> @@ -26,6 +30,8 @@ do_compile() {
>>
>>      cd src
>>      ./make.bash --host-only
>> +    # Ensure cgo.a is built with the target toolchain
>> +    GO_FLAGS="-a" ./make.bash --target-only
>>  }
>>
>>  do_install() {
>> @@ -38,7 +44,9 @@ do_install() {
>>      install -d ${D}${bindir}
>>      for f in ${B}/bin/*
>>      do
>> -        install -m755 $f ${D}${bindir}
>> +        if [ ! -d "$f" ] ; then
>> +            install -m755 $f ${D}${bindir}
>> +        fi
>>      done
>>  }
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--94eb2c060cf0cc9c6b053d37784f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Sep 22, 2016 at 10:04 AM, Bruce Ashfield <span dir=3D"ltr">&lt;=
<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfiel=
d@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><div dir=3D"ltr"><div><div>merged.<br></div><br></div></div></b=
lockquote><div><br></div><div>bad news. This broke the build of go-cross on=
 my machines (and on others .. which</div><div>is why I went to look into i=
t).</div><div><br></div><div>Errors like this:</div><div><br></div><div>---=
---------------------------</div><div>







<p class=3D"gmail-p1"><span class=3D"gmail-s1">| /home/bruce/poky/build/tmp=
/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e=
36d0657b-r0/git/hack/make/.go-autogen: line 23: /home/bruce/poky/build/tmp/=
sysroots/x86_64-linux/usr/bin/x86_64-pok</span></p><p class=3D"gmail-p1"><s=
pan class=3D"gmail-s1">y-linux/go: No such file or directory</span></p><p c=
lass=3D"gmail-p1"><span class=3D"gmail-s1">| ./hack/make.sh: line 221: /hom=
e/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go: =
No such file or directory</span></p><p class=3D"gmail-p1"><span class=3D"gm=
ail-s1">| bundles/1.12.0-dev already exists. Removing.</span></p><p class=
=3D"gmail-p1"><span class=3D"gmail-s1">|</span></p><p class=3D"gmail-p1"><s=
pan class=3D"gmail-s1">| ./hack/make.sh: line 361: /home/bruce/poky/build/t=
mp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go: No such file or dire=
ctory</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| ---&gt; Ma=
king bundle: dynbinary (in bundles/1.12.0-dev/dynbinary)</span></p><p class=
=3D"gmail-p1"><span class=3D"gmail-s1">| ./hack/make.sh: line 288: /home/br=
uce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go: No s=
uch file or directory</span></p><p class=3D"gmail-p1"><span class=3D"gmail-=
s1">| /home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git=
34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.go-autogen: line=
 23: /home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-pok</s=
pan></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">y-linux/go: No such =
file or directory</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">=
| /home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9=
a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary: line 13: /ho=
me/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-li</span>=
</p><p class=3D"gmail-p1"><span class=3D"gmail-s1">nux/go: No such file or =
directory</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| /home/=
bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914=
d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary: line 13: /home/bruce=
/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go: No such=
 file or directory</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1"=
>| /home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d=
9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary: line 13: /h=
ome/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go=
: No such file or directory</span></p><p class=3D"gmail-p1"><span class=3D"=
gmail-s1">| /home/bruce/poky/build/tmp/work/core2-64-poky-linux/docker/1.12=
.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.binary: li=
ne 13: /home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x86_64-poky=
-linux/go: No such file or directory</span></p><p class=3D"gmail-p1"><span =
class=3D"gmail-s1">| /home/bruce/poky/build/tmp/work/core2-64-poky-linux/do=
cker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d1d4e36d0657b-r0/git/hack/make/.b=
inary: line 23: /home/bruce/poky/build/tmp/sysroots/x86_64-linux/usr/bin/x8=
6_64-poky-linux/go: No such file or directory</span></p><p class=3D"gmail-p=
1"><span class=3D"gmail-s1">| Building: bundles/1.12.0-dev/dynbinary-client=
/docker-1.12.0-dev</span></p><p>
























</p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| /home/bruce/poky/build=
/tmp/work/core2-64-poky-linux/docker/1.12.0+git34d9a8240914d30f3a8fe28c1b7d=
1d4e36d0657b-r0/git/hack/make/.binary: line 51: /home/bruce/poky/build/tmp/=
sysroots/x86_64-linux/usr/bin/x86_64-poky-linux/go: No such file or directo=
ry</span></p><p><span>------------------</span></p><p><span><br></span></p>=
<p><span>and this:</span></p><p><span><br></span></p><p><span>-------------=
--</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">Log data follow=
s:</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| DEBUG: Execut=
ing shell function do_compile</span></p><p class=3D"gmail-p1"><span class=
=3D"gmail-s1">| NOTE: make -j 20 static</span></p><p class=3D"gmail-p1"><sp=
an class=3D"gmail-s1">| ERROR: oe_runmake failed</span></p><p class=3D"gmai=
l-p1"><span class=3D"gmail-s1">| /home/bruce/poky/build/tmp/work/core2-64-p=
oky-linux/containerd/0.2.2+git0ac3cd1be170d180b2baed755e8f0da547ceb267-r0/g=
it</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| cd ctr &amp;&=
amp; go build -ldflags &quot;-w -extldflags -static -X <a href=3D"http://gi=
thub.com/docker/containerd.GitCommit=3D0ac3cd1be170d180b2baed755e8f0da547ce=
b267">github.com/docker/containerd.GitCommit=3D0ac3cd1be170d180b2baed755e8f=
0da547ceb267</a> &quot; -tags &quot;&quot; -o ../bin/ctr</span></p><p class=
=3D"gmail-p1"><span class=3D"gmail-s1">| cd containerd &amp;&amp; go build =
-ldflags &quot;-w -extldflags -static -X <a href=3D"http://github.com/docke=
r/containerd.GitCommit=3D0ac3cd1be170d180b2baed755e8f0da547ceb267">github.c=
om/docker/containerd.GitCommit=3D0ac3cd1be170d180b2baed755e8f0da547ceb267</=
a> &quot; -tags &quot;&quot; -o ../bin/containerd</span></p><p class=3D"gma=
il-p1"><span class=3D"gmail-s1">| cd containerd-shim &amp;&amp; go build -l=
dflags &quot;-w -extldflags -static -X <a href=3D"http://github.com/docker/=
containerd.GitCommit=3D0ac3cd1be170d180b2baed755e8f0da547ceb267">github.com=
/docker/containerd.GitCommit=3D0ac3cd1be170d180b2baed755e8f0da547ceb267</a>=
 &quot; -tags &quot;&quot; -o ../bin/containerd-shim</span></p><p class=3D"=
gmail-p1"><span class=3D"gmail-s1">| # <a href=3D"http://github.com/docker/=
docker/pkg/term">github.com/docker/docker/pkg/term</a></span></p><p class=
=3D"gmail-p1"><span class=3D"gmail-s1">| cannot load DWARF output from $WOR=
K/<a href=3D"http://github.com/docker/docker/pkg/term/_obj//_cgo_.o">github=
.com/docker/docker/pkg/term/_obj//_cgo_.o</a>: decoding dwarf section info =
at offset 0x4: unsupported version 0</span></p><p class=3D"gmail-p1"><span =
class=3D"gmail-s1">| make: *** [shim-static] Error 2</span></p><p class=3D"=
gmail-p1"><span class=3D"gmail-s1">| make: *** Waiting for unfinished jobs.=
...</span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| # <a href=3D=
"http://github.com/docker/docker/pkg/term">github.com/docker/docker/pkg/ter=
m</a></span></p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| cannot loa=
d DWARF output from $WORK/<a href=3D"http://github.com/docker/docker/pkg/te=
rm/_obj//_cgo_.o">github.com/docker/docker/pkg/term/_obj//_cgo_.o</a>: deco=
ding dwarf section info at offset 0x4: unsupported version 0</span></p><p c=
lass=3D"gmail-p1"><span class=3D"gmail-s1">| # <a href=3D"http://github.com=
/opencontainers/runc/libcontainer/system">github.com/opencontainers/runc/li=
bcontainer/system</a></span></p><p>






















</p><p class=3D"gmail-p1"><span class=3D"gmail-s1">| cannot load DWARF outp=
ut from $WORK/<a href=3D"http://github.com/opencontainers/runc/libcontainer=
/system/_obj//_cgo_">github.com/opencontainers/runc/libcontainer/system/_ob=
j//_cgo_</a></span></p><p><span>-------------------------------------------=
</span></p><p><span>In the spirit of keeping things buildable for the most =
part, I reverted the change and we can have another look at this.</span></p=
><p><span><br></span></p><p><span>Bruce</span></p></div><div>=C2=A0</div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div></div=
>Bruce<br></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><=
span>On Tue, Sep 20, 2016 at 1:01 PM, Jason Wessel <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:jason.wessel@windriver.com" target=3D"_blank">jason.wessel@=
windriver.com</a>&gt;</span> wrote:<br></span><div><div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">The go-cross package is explicitly for com=
piling target libraries on<br>
the host system.=C2=A0 When the target architecture matches the host<br>
architecture it will actually use the host&#39;s linker and compiler<br>
however which can result in the generation of the cgo.a library having<br>
linker symbols which might not work properly when compiling other<br>
packages.<br>
<br>
A typical error looks like this when building consul-migrate:<br>
<br>
/opt/build-intel-x86/tmp/sysro<wbr>ots/x86_64-linux/usr/lib/x86_6<wbr>4-lin=
ux/go/pkg/tool/linux_amd6<wbr>4/link: running x86_64-yocto-linux-gcc failed=
: exit status 1<br>
/opt/build-intel-x86/tmp/sysro<wbr>ots/x86_64-linux/usr/libexec/x<wbr>86_64=
-yocto-linux/gcc/x86_64-y<wbr>octo-linux/5.2.0/ld: /opt/build-intel-x86/tmp=
/work/<wbr>core2-64-yocto-linux/consul-mi<wbr>grate/git-r0/build-tmp/go-lin=
k<wbr>-956548052/000002.o: unrecognized relocation (0x2a) in section `.text=
&#39;<br>
/opt/build-intel-x86/tmp/sysro<wbr>ots/x86_64-linux/usr/libexec/x<wbr>86_64=
-yocto-linux/gcc/x86_64-y<wbr>octo-linux/5.2.0/ld: final link failed: Bad v=
alue<br>
collect2: error: ld returned 1 exit status<br>
<br>
The fix is to use the make.bash --target-only option to properly build<br>
the libraries with the target toolchain.<br>
<br>
When the host architecture does not match the target architecture we<br>
must also force build the target libraries or they get dynamically<br>
populated into the sysroot in an uncontrolled manner by the first<br>
package that uses go-cross to compile code.<br>
<br>
Signed-off-by: Jason Wessel &lt;<a href=3D"mailto:jason.wessel@windriver.co=
m" target=3D"_blank">jason.wessel@windriver.com</a>&gt;<br>
---<br>
=C2=A0recipes-devtools/go-cross/go-<wbr>cross.inc | 10 +++++++++-<br>
=C2=A01 file changed, 9 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-devtools/go-cross/go<wbr>-cross.inc b/recipes-devtools=
/go-cross/go<wbr>-cross.inc<br>
index 613e9c7..6363a78 100644<br>
--- a/recipes-devtools/go-cross/go<wbr>-cross.inc<br>
+++ b/recipes-devtools/go-cross/go<wbr>-cross.inc<br>
@@ -2,6 +2,10 @@ inherit cross<br>
<br>
=C2=A0DEPENDS +=3D &quot;go-native&quot;<br>
<br>
+# Prevent runstrip from running because you get errors when the host arch =
!=3D target arch<br>
+#INHIBIT_PACKAGE_STRIP =3D &quot;1&quot;<br>
+STRIP =3D &quot;echo&quot;<br>
+<br>
=C2=A0export GOHOSTOS =3D &quot;${BUILD_GOOS}&quot;<br>
=C2=A0export GOHOSTARCH =3D &quot;${BUILD_GOARCH}&quot;<br>
=C2=A0export GOOS =3D &quot;${TARGET_GOOS}&quot;<br>
@@ -26,6 +30,8 @@ do_compile() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0cd src<br>
=C2=A0 =C2=A0 =C2=A0./make.bash --host-only<br>
+=C2=A0 =C2=A0 # Ensure cgo.a is built with the target toolchain<br>
+=C2=A0 =C2=A0 GO_FLAGS=3D&quot;-a&quot; ./make.bash --target-only<br>
=C2=A0}<br>
<br>
=C2=A0do_install() {<br>
@@ -38,7 +44,9 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0install -d ${D}${bindir}<br>
=C2=A0 =C2=A0 =C2=A0for f in ${B}/bin/*<br>
=C2=A0 =C2=A0 =C2=A0do<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 $f ${D}${bindir}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ ! -d &quot;$f&quot; ] ; then<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 install -m755 $f ${D}${bindir}<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0 =C2=A0 =C2=A0done<br>
=C2=A0}<br>
<span><font color=3D"#888888"><br>
--<br>
1.9.1<br>
<br>
--<br>
______________________________<wbr>_________________<br>
meta-virtualization mailing list<br>
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">m=
eta-virtualization@yoctoproje<wbr>ct.org</a><br>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" rel=
=3D"noreferrer" target=3D"_blank">https://lists.yoctoproject.org<wbr>/listi=
nfo/meta-virtualization</a><br>
</font></span></blockquote></div></div></div><span><font color=3D"#888888">=
<br><br clear=3D"all"><br>-- <br><div>&quot;Thou shalt not follow the NULL =
pointer, for chaos and madness await thee at its end&quot;</div>
</font></span></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div>&quot;T=
hou shalt not follow the NULL pointer, for chaos and madness await thee at =
its end&quot;</div>
</div></div>

--94eb2c060cf0cc9c6b053d37784f--

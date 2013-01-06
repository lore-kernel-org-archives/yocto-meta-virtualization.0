Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f51.google.com (mail-la0-f51.google.com
	[209.85.215.51])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9DE2CE00709
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 19:37:27 -0800 (PST)
Received: by mail-la0-f51.google.com with SMTP id fj20so12170051lab.24
	for <meta-virtualization@yoctoproject.org>;
	Sat, 05 Jan 2013 19:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=EZRM00kUn0UYHgPpRY1nodhiCVzZUtfMlJykNJL5uqc=;
	b=Cg2gN4+Fl5B6SlmiC+VH/RcopCwvZymvTvL8vfTgy+caUi4UtvDL5O60etfp4OssxJ
	n6sMyM2eo7iju5grJkPr4YyQrxy8aBqcMHzsQrGUT8ZJoN0ii4TGbOKAa3f+Rg8bwNLy
	TInJzUaMWCr6YPZPQ8FHejgzqez3bxup6HS8YZso3yHUKs4kjAXhu1pNHtNOVD+GKQJi
	jYIDeZEQdgdeUJqZrjZCBjiG3DSIDHnKvasHSeiyXWIBSmY5+iBELgG0qAPrYC+4UmTA
	DZFIQcuOL6mK1u3jB5RpYrzttSWG4sszTs7fslgxbmiKeEJdSMFTIeBwVZzzzzqbFfju
	2NEQ==
MIME-Version: 1.0
Received: by 10.152.145.8 with SMTP id sq8mr53708901lab.21.1357443446402; Sat,
	05 Jan 2013 19:37:26 -0800 (PST)
Received: by 10.112.127.35 with HTTP; Sat, 5 Jan 2013 19:37:26 -0800 (PST)
In-Reply-To: <CADkTA4O7MeMT6b2212_aPkrQDhD4Gu9_D27e0YZn3K8LhaPiEw@mail.gmail.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
	<50E83CC7.60608@enea.com>
	<CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
	<0BF1DE0F-6CAD-4128-811E-EB9C6BBD1566@gmail.com>
	<CADkTA4MugpvRrVGjefpOspwj4ZAOvAk8cYFnm=vqxxFYM0vo5Q@mail.gmail.com>
	<50E8DB6D.6010806@windriver.com>
	<CADkTA4O7MeMT6b2212_aPkrQDhD4Gu9_D27e0YZn3K8LhaPiEw@mail.gmail.com>
Date: Sat, 5 Jan 2013 22:37:26 -0500
Message-ID: <CADkTA4PJDAW85B2sQmJniGVrn3VfZ=D56Peg3Cfjvv3L+x6AuQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: lei.yang@windriver.com
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Update the netcat with debian patches to fix some error
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
X-List-Received-Date: Sun, 06 Jan 2013 03:37:28 -0000
Content-Type: multipart/alternative; boundary=e89a8f22bc296cf05004d2966e0b

--e89a8f22bc296cf05004d2966e0b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 5, 2013 at 10:00 PM, Bruce Ashfield <bruce.ashfield@gmail.com>w=
rote:

>
>
>
> On Sat, Jan 5, 2013 at 9:03 PM, Lei Yang <lei.yang@windriver.com> wrote:
>
>>  On 01/06/2013 08:53 AM, Bruce Ashfield wrote:
>>
>>
>>
>>
>> On Sat, Jan 5, 2013 at 7:28 PM, Lei Yang <yanglei.fage@gmail.com> wrote:
>>
>>>  Hi Bruce
>>>
>>>  I checked the netcat with my phone in meta-networking ,It's not the
>>> bsd netcat,in libvirt or my vert-test,we need to use bsd netcat,they ar=
e
>>> different source.
>>>
>>
>>  That was understood, and what I meant by:
>>
>>  "If there are any specific meta-virt requirements for netcat, we should
>> either use bbappends (and
>> depend on meta-networking, or use the combo-layer tools to pull the
>> support directly) or better yet
>> get them merged into meta-networking."
>>
>>  The solution is not to carry a similar netcat in meta-virt, but to have
>> a single netcat source, which
>>  is meta-virtualization.
>>
>>
>> I don't know I catch you or not
>>
>> solution 1:
>> =3D=3D=3D=3D=3D=3D=3D
>>
>>
>> create a bbappend in meta-virt. there are two issue
>> a. they have different licence, one is GPLv2 aother is BSD-3-Clause, I
>> don't know if we are allowed to overwritte the LICENSE
>> b. and they have different PV history, one is 0.71, another is 0.89, so
>> this can't be append
>>
>> soulution 2:
>> =3D=3D=3D=3D=3D=3D=3D=3D
>>
>>
>> seems you want something like this in meta-networing
>> [lyang0@ala-lpggp2 netcat]$ ls
>> netcat_0.7.1.bb    netcat-openbsd_1.89.bb netcat.inc
>>
>> netcat.inc is something like,below other part(DESCRIPTION HOMEPAGE
>> license SRC_URI) ...will be in there bb file, seems what they can share =
is
>> little.
>>
>> inherit autotools update-alternatives gettext
>>
>> do_install_append() {
>>         mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
>> }
>>
>> ALTERNATIVE_${PN} =3D "nc"
>> ALTERNATIVE_PRIORITY =3D "100"
>>
>
> It's solution #2 that would be preferable. Since meta-networking is the
> provider of the current
> netcat in the set of yocto layers, it makes sense to not expend time and
> effort supporting an
> alternative in meta-virt, but to move the variant that is required into
> meta-networking.
>
> It would be even better to break the requirement completely (by changing
> the tools that have
> the BSP specific requirement). I haven't dug into it yet, is it
> arguments/syntax, or purely a
> licensing issue that creates the requirement ? Given your patch, I think
> it's the former, but
> as I said, I haven't gone to look yet.
>
> .. but breaking the dependency is much easier to say, than to do :)
>
> The combo layer tools could come into play after we've got the BSD netcat
> support in
> meta-networking, and for some reason we can't depend on meta-networking
> and only need
> the one package. The combo tools can pull that support of our
> meta-networking and place
> it in meta-virt .. in a maintainable way.
>

And in case you haven't found it yet:

https://wiki.yoctoproject.org/wiki/Combo-layer

Cheers,

Bruce


>
> Cheers,
>
> Bruce
>
>
>>
>> By the way I don't know what is combo-layer tools
>>
>> Lei
>>
>>
>>
>>
>>
>>
>>   There's no rush to merge this, there's no impending releases, so we
>> should take our time and
>> unify the support, not create a very similar structure in meta-virt.
>>
>>  Cheers,
>>
>>  Bruce
>>
>>
>>
>>>
>>>  Lei
>>>
>>> Sent from my iPhone
>>>
>>> On 2013-1-6, at 2:44, Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>>>
>>>
>>>
>>>
>>> On Sat, Jan 5, 2013 at 9:46 AM, David Nystr=F6m <david.nystrom@enea.com=
>wrote:
>>>
>>>>
>>>>
>>>> On 01/05/2013 03:26 PM, lei yang wrote:
>>>>
>>>>> On Sat, Jan 5, 2013 at 5:55 AM, David Nystr=F6m <
>>>>> david.c.nystrom@gmail.com> wrote:
>>>>>
>>>>>> On 01/05/2013 02:43 PM, lei.yang@windriver.com wrote:
>>>>>>
>>>>>>>
>>>>>>> From: Lei Yang <lei.yang@windriver.com>
>>>>>>>
>>>>>>> I know we have the patches in debian dir in the previous version,
>>>>>>> but I meet lots of patch error.so I change it to debian.org version
>>>>>>>
>>>>>>> The background I do this change is:
>>>>>>> I'm a kvm tester,without patches it will meet error when I do the
>>>>>>> migrate
>>>>>>> testing with  -incoming "exec:nc -l 5200" it meets error:
>>>>>>> "nc: Protocol no available."
>>>>>>>
>>>>>>> You can reproduce it simplely with "nc -l 5200" on your board
>>>>>>>
>>>>>>> Lei
>>>>>>>
>>>>>>> Signed-off-by: Lei Yang <lei.yang@windriver.com>
>>>>>>> ---
>>>>>>>
>>>>>>
>>>>>>
>>>>>> [snip]
>>>>>>
>>>>>>
>>>>>> +do_compile() {
>>>>>>> +       cd ${S}
>>>>>>> +        while read line; do patch -p1 <debian/patches/$line; done
>>>>>>> <debian/patches/series
>>>>>>>
>>>>>>
>>>>>>
>>>>>> Is this line really needed ?
>>>>>> I cant seem to find any file called debian/patches/* in ${S}.
>>>>>>
>>>>>>
>>>>> Yes it needed,
>>>>> http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbs=
d_1.89-4.diff.gz
>>>>> will be download, and gunzip by bitbake automaticlly, then it find
>>>>> .diff (or patch) it will automatically apply(before I thought only
>>>>> .patch will be applied, now I find .diff will be applied ) then you
>>>>> will see the debian/patches dir  created by .dff
>>>>>
>>>>> logs:
>>>>> lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ ls
>>>>> build/netcat-openbsd-1.89-r0/netcat-openbsd-1.89.orig/
>>>>> atomicio.c      atomicio.o      Makefile        nc.1
>>>>> netcat.c.orig   openbsd-compat/ .pc/            socks.o
>>>>> atomicio.h      debian/         nc              netcat.c
>>>>> netcat.o        patches/        socks.c
>>>>>
>>>>>
>>>>>
>>>>>> +       pkgrel=3D4
>>>>>>> +       oe_runmake CFLAGS=3D"$CFLAGS
>>>>>>> -DDEBIAN_VERSION=3D\"\\\"${pkgrel}\\\"\""
>>>>>>>
>>>>>>
>>>>>>
>>>>>> I assume this has been tested with package_rpm as well.
>>>>>>
>>>>>>
>>>>>>
>>>>> Yes, I'm a tester .welcome any testing work to let me do freely
>>>>>
>>>>> lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ cat
>>>>> build/netcat-openbsd-1.89-r0/deploy-rpms/x86_64/netcat-openbsd-
>>>>> netcat-openbsd-1.89-r0.x86_64.rpm
>>>>> netcat-openbsd-dbg-1.89-r0.x86_64.rpm
>>>>> netcat-openbsd-dev-1.89-r0.x86_64.rpm
>>>>>
>>>>>
>>>>  Thanks Lei,
>>>> I'll merge this as soon as I can, I seem to be unable to push at the
>>>> moment. I'll try to resolv this asap.
>>>>
>>>>
>>>>
>>>  I think we should hold on this merge completely. netcat is already
>>> covered by meta-networking, so
>>> we should be consolidating patches and support there.
>>>
>>>  If there are any specific meta-virt requirements for netcat, we should
>>> either use bbappends (and
>>> depend on meta-networking, or use the combo-layer tools to pull the
>>> support directly) or better yet
>>> get them merged into meta-networking.
>>>
>>>  Cheers,
>>>
>>>  Bruce
>>>
>>>
>>>>
>>>>>
>>>>>
>>>>>  +}
>>>>>>> +
>>>>>>> +do_install() {
>>>>>>> +       install -d ${D}${bindir}
>>>>>>> +       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>>>>>> +}
>>>>>>> +
>>>>>>> +ALTERNATIVE_${PN} =3D "nc"
>>>>>>> +ALTERNATIVE_PRIORITY =3D "101"
>>>>>>> +
>>>>>>> +BBCLASSEXTEND =3D "nativesdk"
>>>>>>> diff --git a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>>>>> b/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>>>>> deleted file mode 100644
>>>>>>> index 1ae3f37..0000000
>>>>>>> --- a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>>>>> +++ /dev/null
>>>>>>> @@ -1,29 +0,0 @@
>>>>>>> -DESCRIPTION =3D "OpenBSD Netcat"
>>>>>>> -HOMEPAGE =3D "http://code.google.com/p/openbsd-netcat/"
>>>>>>> -SECTION =3D "console/network"
>>>>>>> -LICENSE =3D "BSD-3-Clause"
>>>>>>> -PR =3D "r0"
>>>>>>> -
>>>>>>> -SRCREV =3D "5"
>>>>>>> -
>>>>>>> -SRC_URI =3D
>>>>>>> "svn://openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3D=
http"
>>>>>>> -S =3D "${WORKDIR}/trunk"
>>>>>>> -
>>>>>>> -inherit update-alternatives gettext
>>>>>>> -
>>>>>>> -do_configure[noexec] =3D "1"
>>>>>>> -
>>>>>>> -do_compile() {
>>>>>>> -       cd ${S}
>>>>>>> -       oe_runmake
>>>>>>> -}
>>>>>>> -
>>>>>>> -do_install() {
>>>>>>> -       install -d ${D}${bindir}
>>>>>>> -       install -m 755 ${S}/nc ${D}${bindir}/nc.${BPN}
>>>>>>> -}
>>>>>>> -
>>>>>>> -ALTERNATIVE_${PN} =3D "nc"
>>>>>>> -ALTERNATIVE_PRIORITY =3D "101"
>>>>>>> -
>>>>>>> -BBCLASSEXTEND =3D "nativesdk"
>>>>>>>
>>>>>>>
>>>>>> _______________________________________________
>>>>>> meta-virtualization mailing list
>>>>>> meta-virtualization@yoctoproject.org
>>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>>>
>>>>> _______________________________________________
>>>>> meta-virtualization mailing list
>>>>> meta-virtualization@yoctoproject.org
>>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>>
>>>>>  _______________________________________________
>>>> meta-virtualization mailing list
>>>> meta-virtualization@yoctoproject.org
>>>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>>
>>>
>>>
>>>
>>>  --
>>> "Thou shalt not follow the NULL pointer, for chaos and madness await
>>> thee at its end"
>>>
>>>
>>
>>
>>  --
>> "Thou shalt not follow the NULL pointer, for chaos and madness await the=
e
>> at its end"
>>
>>
>> _______________________________________________
>> meta-virtualization mailing listmeta-virtualization@yoctoproject.orghttp=
s://lists.yoctoproject.org/listinfo/meta-virtualization
>>
>>
>>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--e89a8f22bc296cf05004d2966e0b
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On Sat, Jan 5, 2013 at 10:00 PM, Bruce Ashfield <span dir=3D"ltr">&=
lt;<a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashf=
ield@gmail.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><=
div class=3D"gmail_quote">
<div><div class=3D"h5">On Sat, Jan 5, 2013 at 9:03 PM, Lei Yang <span dir=
=3D"ltr">&lt;<a href=3D"mailto:lei.yang@windriver.com" target=3D"_blank">l=
ei.yang@windriver.com</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;=
padding-left:1ex">
  
    
  
  <div bgcolor=3D"#FFFFFF" text=3D"#000000"><div>
    On 01/06/2013 08:53 AM, Bruce Ashfield wrote:
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr"><br>
        <div class=3D"gmail_extra"><br>
          <br>
          <div class=3D"gmail_quote">On Sat, Jan 5, 2013 at 7:28 PM, Lei
            Yang <span dir=3D"ltr">&lt;<a href=3D"mailto:yanglei.fage@gmai=
l.com" target=3D"_blank">yanglei.fage@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex">
              <div dir=3D"auto">
                <div>Hi Bruce=A0</div>
                <div><br>
                </div>
                <div>I checked the netcat with my phone in
                  meta-networking ,It&#39;s not the bsd netcat,in libvirt =
or
                  my vert-test,we need to use bsd netcat,they are
                  different source.</div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div>That was understood, and what I meant by:</div>
            <div><span style=3D"color:rgb(80,0,80)"><br>
              </span></div>
            <div><span style=3D"color:rgb(80,0,80)">&quot;If there are
                any specific meta-virt requirements for netcat, we
                should either use bbappends (and</span></div>
            <div><span style=3D"color:rgb(80,0,80)">depend on
                meta-networking, or use the combo-layer tools to pull
                the support directly) or better</span><span style=3D"color=
:rgb(80,0,80)">=A0yet</span></div>
            <div><span style=3D"color:rgb(80,0,80)">get them
                merged into meta-networking.&quot;</span></div>
            <div><span style=3D"color:rgb(80,0,80)"><br>
              </span></div>
            <div><span style=3D"color:rgb(80,0,80)">The solution
                is not to carry a similar netcat in meta-virt, but to
                have a single netcat source, which</span></div>
            <div>
              <font color=3D"#500050">is meta-virtualization.</font></div>
            <div><font color=3D"#500050"><br>
              </font></div>
          </div>
        </div>
      </div>
    </blockquote>
    <br></div>
    I don&#39;t know I catch you or not <br>
    <br>
    solution 1:<br>
    =3D=3D=3D=3D=3D=3D=3D<br>
    <br>
    <br>
    create a bbappend in meta-virt. there are two issue<br>
    a. they have different licence, one is GPLv2 aother is BSD-3-Clause,
    I don&#39;t know if we are allowed to overwritte the LICENSE<br>
    b. and they have different PV history, one is 0.71, another is 0.89,
    so this can&#39;t be append <br>
    <br>
    soulution 2:<br>
    =3D=3D=3D=3D=3D=3D=3D=3D<br>
    <br>
    <br>
    seems you want something like this in meta-networing <br>
    [lyang0@ala-lpggp2 netcat]$ ls<br>
    <a href=3D"http://netcat_0.7.1.bb" target=3D"_blank">netcat_0.7.1.bb</=
a>=A0=A0=A0 <a href=3D"http://netcat-openbsd_1.89.bb" target=3D"_blank">net=
cat-openbsd_1.89.bb</a> netcat.inc<br>
    <br>
    netcat.inc is something like,below other part(DESCRIPTION HOMEPAGE
    license SRC_URI) ...will be in there bb file, seems what they can
    share is little.<br>
    <br>
    inherit autotools update-alternatives gettext<br>
    <br>
    do_install_append() {<br>
    =A0=A0=A0=A0=A0=A0=A0 mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}<br>
    }<br>
    <br>
    ALTERNATIVE_${PN} =3D &quot;nc&quot;<br>
    ALTERNATIVE_PRIORITY =3D &quot;100&quot;<br></div></blockquote><div><b=
r></div></div></div><div>It&#39;s solution #2 that would be preferable. Sin=
ce meta-networking is the provider of the current</div><div>netcat in the s=
et of yocto layers, it makes sense to not expend time and effort supporting=
 an</div>

<div>alternative in meta-virt, but to move the variant that is required in=
to meta-networking.</div><div><br></div><div>It would be even better to bre=
ak the requirement completely (by changing the tools that have</div>
<div>the BSP specific requirement). I haven&#39;t dug into it yet, is it a=
rguments/syntax, or purely a=A0</div><div>licensing issue that creates the =
requirement ? Given your patch, I think it&#39;s the former, but</div>
<div>as I said, I haven&#39;t gone to look yet.</div><div><br></div><div>.=
. but breaking the dependency is much easier to say, than to do :)</div><di=
v><br></div><div>The combo layer tools could come into play after we&#39;ve=
 got the BSD netcat support in=A0</div>

<div>meta-networking, and for some reason we can&#39;t depend on meta-netw=
orking and only need</div><div>the one package. The combo tools can pull th=
at support of our meta-networking and place</div><div>
it in meta-virt .. in a maintainable way.</div></div></div></div></blockqu=
ote><div><br></div><div style>And in case you haven&#39;t found it yet:</di=
v><div style><br></div><div style><a href=3D"https://wiki.yoctoproject.org/=
wiki/Combo-layer">https://wiki.yoctoproject.org/wiki/Combo-layer</a><br>
</div><div style><br></div><div style>Cheers,</div><div style><br></div><d=
iv style>Bruce</div><div>=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">
<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote"><di=
v><br></div><div>Cheers,</div><div><br></div><div>Bruce</div><div><div clas=
s=3D"h5"><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);b=
order-left-style:solid;padding-left:1ex">

<div bgcolor=3D"#FFFFFF" text=3D"#000000">
    <br>
    <br>
    By the way I don&#39;t know what is <span style=3D"color:rgb(80,0,80)"=
>combo-layer
      tools </span><br>
    <br>
    Lei<div><div><br>
    <br>
    <br>
    <br>
    <br>
    <br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">
        <div class=3D"gmail_extra">
          <div class=3D"gmail_quote">
            <div><font color=3D"#500050">There&#39;s no rush to merge
                this, there&#39;s no impending releases, so we should take
                our time and</font></div>
            <div><font color=3D"#500050">unify the support, not
                create a very similar structure in meta-virt.</font></div>
            <div><font color=3D"#500050"><br>
              </font></div>
            <div><font color=3D"#500050">Cheers,</font></div>
            <div>
              <font color=3D"#500050"><br>
              </font></div>
            <div><font color=3D"#500050">Bruce</font></div>
            <div><br>
            </div>
            <div>=A0</div>
            <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-=
style:solid;padding-left:1ex">
              <div dir=3D"auto">
                <div><br>
                </div>
                <div>Lei<br>
                  <br></div>
                <div>
                  <div>
                    <div><br>
                      On 2013-1-6, at 2:44, Bruce Ashfield &lt;<a href=3D"=
mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield@gmail.com=
</a>&gt;
                      wrote:<br>
                      <br>
                    </div>
                    <blockquote type=3D"cite">
                      <div>
                        <div dir=3D"ltr"><br>
                          <div class=3D"gmail_extra"><br>
                            <br>
                            <div class=3D"gmail_quote">On Sat, Jan 5, 2013
                              at 9:46 AM, David Nystr=F6m <span dir=3D"ltr=
">&lt;<a href=3D"mailto:david.nystrom@enea.com" target=3D"_blank">david.nys=
trom@enea.com</a>&gt;</span>
                              wrote:<br>
                              <blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex">
                                <div>
                                  <div><br>
                                    <br>
                                    On 01/05/2013 03:26 PM, lei yang
                                    wrote:<br>
                                    <blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex">On
                                      Sat, Jan 5, 2013 at 5:55 AM, David
                                      Nystr=F6m &lt;<a href=3D"mailto:davi=
d.c.nystrom@gmail.com" target=3D"_blank">david.c.nystrom@gmail.com</a>&gt;
                                      wrote:<br>
                                      <blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex">On
                                        01/05/2013 02:43 PM, <a href=3D"ma=
ilto:lei.yang@windriver.com" target=3D"_blank">lei.yang@windriver.com</a>
                                        wrote:<br>
                                        <blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex"><br>
                                          From: Lei Yang &lt;<a href=3D"ma=
ilto:lei.yang@windriver.com" target=3D"_blank">lei.yang@windriver.com</a>&g=
t;<br>
                                          <br>
                                          I know we have the patches in
                                          debian dir in the previous
                                          version,<br>
                                          but I meet lots of patch
                                          error.so I change it to <a href=
=3D"http://debian.org" target=3D"_blank">debian.org</a>
                                          version<br>
                                          <br>
                                          The background I do this
                                          change is:<br>
                                          I&#39;m a kvm tester,without
                                          patches it will meet error
                                          when I do the migrate<br>
                                          testing with =A0-incoming
                                          &quot;exec:nc -l 5200&quot; it m=
eets
                                          error:<br>
                                          &quot;nc: Protocol no available.=
&quot;<br>
                                          <br>
                                          You can reproduce it simplely
                                          with &quot;nc -l 5200&quot; on y=
our
                                          board<br>
                                          <br>
                                          Lei<br>
                                          <br>
                                          Signed-off-by: Lei Yang &lt;<a h=
ref=3D"mailto:lei.yang@windriver.com" target=3D"_blank">lei.yang@windriver.=
com</a>&gt;<br>
                                          ---<br>
                                        </blockquote>
                                        <br>
                                        <br>
                                        [snip]<br>
                                        <br>
                                        <br>
                                        <blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex">+do_compile()
                                          {<br>
                                          + =A0 =A0 =A0 cd ${S}<br>
                                          + =A0 =A0 =A0 =A0while read line=
; do
                                          patch -p1
                                          &lt;debian/patches/$line; done<b=
r>
                                          &lt;debian/patches/series<br>
                                        </blockquote>
                                        <br>
                                        <br>
                                        Is this line really needed ?<br>
                                        I cant seem to find any file
                                        called debian/patches/* in ${S}.<b=
r>
                                        <br>
                                      </blockquote>
                                      <br>
                                      Yes it needed, <a href=3D"http://ftp=
.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz=
" target=3D"_blank">http://ftp.debian.org/debian/pool/main/n/netcat-openbsd=
/netcat-openbsd_1.89-4.diff.gz</a><br>


                                      will be download, and gunzip by
                                      bitbake automaticlly, then it find<b=
r>
                                      .diff (or patch) it will
                                      automatically apply(before I
                                      thought only<br>
                                      .patch will be applied, now I find
                                      .diff will be applied ) then you<br>
                                      will see the debian/patches dir
                                      =A0created by .dff<br>
                                      <br>
                                      logs:<br>
                                      lyang0@pek-lpgtest1:/buildarea1/lyan=
g0/kvm_rr$
                                      ls<br>
                                      build/netcat-openbsd-1.89-r0/netcat-=
openbsd-1.89.orig/<br>
                                      atomicio.c =A0 =A0 =A0atomicio.o =A0=
 =A0
                                      =A0Makefile =A0 =A0 =A0 =A0nc.1<br>
                                      netcat.c.orig =A0 openbsd-compat/
                                      .pc/ =A0 =A0 =A0 =A0 =A0 =A0socks.o<=
br>
                                      atomicio.h =A0 =A0 =A0debian/ =A0 =
=A0 =A0 =A0 nc
                                      =A0 =A0 =A0 =A0 =A0 =A0 =A0netcat.c<=
br>
                                      netcat.o =A0 =A0 =A0 =A0patches/ =A0=
 =A0 =A0
                                      =A0socks.c<br>
                                      <br>
                                      <br>
                                      <blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex"><br>
                                        <blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex">+
                                          =A0 =A0 =A0 pkgrel=3D4<br>
                                          + =A0 =A0 =A0 oe_runmake
                                          CFLAGS=3D&quot;$CFLAGS
                                          -DDEBIAN_VERSION=3D\&quot;\\\&qu=
ot;${pkgrel}\\\&quot;\&quot;&quot;<br>
                                        </blockquote>
                                        <br>
                                        <br>
                                        I assume this has been tested
                                        with package_rpm as well.<br>
                                        <br>
                                        <br>
                                      </blockquote>
                                      <br>
                                      Yes, I&#39;m a tester .welcome any
                                      testing work to let me do freely<br>
                                      <br>
                                      lyang0@pek-lpgtest1:/buildarea1/lyan=
g0/kvm_rr$
                                      cat<br>
                                      build/netcat-openbsd-1.89-r0/deploy-=
rpms/x86_64/netcat-openbsd-<br>
                                      netcat-openbsd-1.89-r0.x86_64.rpm<br=
>
                                      netcat-openbsd-dbg-1.89-r0.x86_64.rp=
m<br>
                                      netcat-openbsd-dev-1.89-r0.x86_64.rp=
m<br>
                                      <br>
                                    </blockquote>
                                    <br>
                                  </div>
                                </div>
                                Thanks Lei,<br>
                                I&#39;ll merge this as soon as I can, I se=
em
                                to be unable to push at the moment. I&#39;=
ll
                                try to resolv this asap.
                                <div>
                                  <div><br>
                                    <br>
                                  </div>
                                </div>
                              </blockquote>
                              <div><br>
                              </div>
                              <div>I think we should hold on this merge
                                completely. netcat is already covered by
                                meta-networking, so</div>
                              <div>we should be consolidating patches
                                and support there.</div>
                              <div><br>
                              </div>
                              <div>If there are any specific meta-virt
                                requirements for netcat, we should
                                either use bbappends (and</div>
                              <div>depend on meta-networking, or use the
                                combo-layer tools to pull the support
                                directly) or better yet</div>
                              <div>get them merged into meta-networking.</=
div>
                              <div><br>
                              </div>
                              <div>Cheers,</div>
                              <div><br>
                              </div>
                              <div>Bruce</div>
                              <div>=A0</div>
                              <blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204=
,204);border-left-style:solid;padding-left:1ex">
                                <div>
                                  <div>
                                    <blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(2=
04,204,204);border-left-style:solid;padding-left:1ex"><br>
                                      <br>
                                      <br>
                                      <blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb=
(204,204,204);border-left-style:solid;padding-left:1ex">
                                        <blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:r=
gb(204,204,204);border-left-style:solid;padding-left:1ex">+}<br>
                                          +<br>
                                          +do_install() {<br>
                                          + =A0 =A0 =A0 install -d
                                          ${D}${bindir}<br>
                                          + =A0 =A0 =A0 install -m 755 ${S=
}/nc
                                          ${D}${bindir}/nc.${BPN}<br>
                                          +}<br>
                                          +<br>
                                          +ALTERNATIVE_${PN} =3D &quot;nc&=
quot;<br>
                                          +ALTERNATIVE_PRIORITY =3D &quot;=
101&quot;<br>
                                          +<br>
                                          +BBCLASSEXTEND =3D &quot;natives=
dk&quot;<br>
                                          diff --git
                                          a/recipes-networking/netcat/<a h=
ref=3D"http://openbsd-netcat_1.6.bb" target=3D"_blank">openbsd-netcat_1.6.b=
b</a><br>
                                          b/recipes-networking/netcat/<a h=
ref=3D"http://openbsd-netcat_1.6.bb" target=3D"_blank">openbsd-netcat_1.6.b=
b</a><br>
                                          deleted file mode 100644<br>
                                          index 1ae3f37..0000000<br>
                                          ---
                                          a/recipes-networking/netcat/<a h=
ref=3D"http://openbsd-netcat_1.6.bb" target=3D"_blank">openbsd-netcat_1.6.b=
b</a><br>
                                          +++ /dev/null<br>
                                          @@ -1,29 +0,0 @@<br>
                                          -DESCRIPTION =3D &quot;OpenBSD
                                          Netcat&quot;<br>
                                          -HOMEPAGE =3D &quot;<a href=3D"h=
ttp://code.google.com/p/openbsd-netcat/" target=3D"_blank">http://code.goog=
le.com/p/openbsd-netcat/</a>&quot;<br>
                                          -SECTION =3D &quot;console/netwo=
rk&quot;<br>
                                          -LICENSE =3D &quot;BSD-3-Clause&=
quot;<br>
                                          -PR =3D &quot;r0&quot;<br>
                                          -<br>
                                          -SRCREV =3D &quot;5&quot;<br>
                                          -<br>
                                          -SRC_URI =3D<br>
                                          &quot;svn://<a href=3D"http://op=
enbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3Dhttp" target=3D"_=
blank">openbsd-netcat.googlecode.com/svn;module=3Dtrunk;protocol=3Dhttp</a>=
&quot;<br>


                                          -S =3D &quot;${WORKDIR}/trunk&qu=
ot;<br>
                                          -<br>
                                          -inherit update-alternatives
                                          gettext<br>
                                          -<br>
                                          -do_configure[noexec] =3D &quot;=
1&quot;<br>
                                          -<br>
                                          -do_compile() {<br>
                                          - =A0 =A0 =A0 cd ${S}<br>
                                          - =A0 =A0 =A0 oe_runmake<br>
                                          -}<br>
                                          -<br>
                                          -do_install() {<br>
                                          - =A0 =A0 =A0 install -d
                                          ${D}${bindir}<br>
                                          - =A0 =A0 =A0 install -m 755 ${S=
}/nc
                                          ${D}${bindir}/nc.${BPN}<br>
                                          -}<br>
                                          -<br>
                                          -ALTERNATIVE_${PN} =3D &quot;nc&=
quot;<br>
                                          -ALTERNATIVE_PRIORITY =3D &quot;=
101&quot;<br>
                                          -<br>
                                          -BBCLASSEXTEND =3D &quot;natives=
dk&quot;<br>
                                          <br>
                                        </blockquote>
                                        <br>
                                        __________________________________=
_____________<br>
                                        meta-virtualization mailing list<b=
r>
                                        <a href=3D"mailto:meta-virtualizat=
ion@yoctoproject.org" target=3D"_blank">meta-virtualization@yoctoproject.or=
g</a><br>
                                        <a href=3D"https://lists.yoctoproj=
ect.org/listinfo/meta-virtualization" target=3D"_blank">https://lists.yocto=
project.org/listinfo/meta-virtualization</a><br>
                                      </blockquote>
                                      ____________________________________=
___________<br>
                                      meta-virtualization mailing list<br>
                                      <a href=3D"mailto:meta-virtualizatio=
n@yoctoproject.org" target=3D"_blank">meta-virtualization@yoctoproject.org<=
/a><br>
                                      <a href=3D"https://lists.yoctoprojec=
t.org/listinfo/meta-virtualization" target=3D"_blank">https://lists.yoctopr=
oject.org/listinfo/meta-virtualization</a><br>
                                      <br>
                                    </blockquote>
                                    ______________________________________=
_________<br>
                                    meta-virtualization mailing list<br>
                                    <a href=3D"mailto:meta-virtualization@=
yoctoproject.org" target=3D"_blank">meta-virtualization@yoctoproject.org</a=
><br>
                                    <a href=3D"https://lists.yoctoproject.=
org/listinfo/meta-virtualization" target=3D"_blank">https://lists.yoctoproj=
ect.org/listinfo/meta-virtualization</a><br>
                                  </div>
                                </div>
                              </blockquote>
                            </div>
                            <br>
                            <br clear=3D"all">
                            <div><br>
                            </div>
                            -- <br>
                            &quot;Thou shalt not follow the NULL pointer, =
for
                            chaos and madness await thee at its end&quot;
                          </div>
                        </div>
                      </div>
                    </blockquote>
                  </div>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear=3D"all">
          <div><br>
          </div>
          -- <br>
          &quot;Thou shalt not follow the NULL pointer, for chaos and madn=
ess
          await thee at its end&quot;
        </div>
      </div>
      <br>
      <fieldset></fieldset>
      <br>
      <pre>_______________________________________________
meta-virtualization mailing list
<a href=3D"mailto:meta-virtualization@yoctoproject.org" target=3D"_blank">=
meta-virtualization@yoctoproject.org</a>
<a href=3D"https://lists.yoctoproject.org/listinfo/meta-virtualization" ta=
rget=3D"_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization=
</a>
</pre>
    </blockquote>
    <br>
  </div></div></div>

</blockquote></div></div></div><div><div class=3D"h5"><br><br clear=3D"all=
"><div><br></div>-- <br>&quot;Thou shalt not follow the NULL pointer, for c=
haos and madness await thee at its end&quot;
</div></div></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br>&quot;Thou =
shalt not follow the NULL pointer, for chaos and madness await thee at its =
end&quot;
</div></div>

--e89a8f22bc296cf05004d2966e0b--

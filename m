Return-Path: <Lei.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6974EE00709
	for <meta-virtualization@yoctoproject.org>;
	Sat,  5 Jan 2013 22:09:58 -0800 (PST)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0669vfq024429
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sat, 5 Jan 2013 22:09:57 -0800 (PST)
Received: from [128.224.158.164] (128.224.158.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Sat, 5 Jan 2013 22:09:56 -0800
Message-ID: <50E9154E.1040806@windriver.com>
Date: Sun, 6 Jan 2013 14:10:22 +0800
From: Lei Yang <lei.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1357393406-11707-1-git-send-email-lei.yang@windriver.com>
	<50E830EF.6030102@gmail.com>
	<CAHsH0E8wu6gn4bnqiDr8AtexVc7kq4zdL3jVWWzOOnqx1zMrZQ@mail.gmail.com>
	<50E83CC7.60608@enea.com>
	<CADkTA4Mx6EQGPb2c7qgjQ0eqQ0P4eFyxnTj38nB2gN=z5KY29Q@mail.gmail.com>
	<0BF1DE0F-6CAD-4128-811E-EB9C6BBD1566@gmail.com>
	<CADkTA4MugpvRrVGjefpOspwj4ZAOvAk8cYFnm=vqxxFYM0vo5Q@mail.gmail.com>
	<50E8DB6D.6010806@windriver.com>
	<CADkTA4O7MeMT6b2212_aPkrQDhD4Gu9_D27e0YZn3K8LhaPiEw@mail.gmail.com>
	<CADkTA4PJDAW85B2sQmJniGVrn3VfZ=D56Peg3Cfjvv3L+x6AuQ@mail.gmail.com>
In-Reply-To: <CADkTA4PJDAW85B2sQmJniGVrn3VfZ=D56Peg3Cfjvv3L+x6AuQ@mail.gmail.com>
X-Originating-IP: [128.224.158.164]
X-Mailman-Approved-At: Sun, 06 Jan 2013 03:28:19 -0800
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] Update the netcat with debian patches to fix some error
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: lei.yang@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Sun, 06 Jan 2013 06:09:58 -0000
Content-Type: multipart/alternative;
	boundary="------------070404050108080406070508"

--------------070404050108080406070508
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 8bit

On 01/06/2013 11:37 AM, Bruce Ashfield wrote:
>
>
>
> On Sat, Jan 5, 2013 at 10:00 PM, Bruce Ashfield 
> <bruce.ashfield@gmail.com <mailto:bruce.ashfield@gmail.com>> wrote:
>
>
>
>
>     On Sat, Jan 5, 2013 at 9:03 PM, Lei Yang <lei.yang@windriver.com
>     <mailto:lei.yang@windriver.com>> wrote:
>
>         On 01/06/2013 08:53 AM, Bruce Ashfield wrote:
>>
>>
>>
>>         On Sat, Jan 5, 2013 at 7:28 PM, Lei Yang
>>         <yanglei.fage@gmail.com <mailto:yanglei.fage@gmail.com>> wrote:
>>
>>             Hi Bruce
>>
>>             I checked the netcat with my phone in meta-networking
>>             ,It's not the bsd netcat,in libvirt or my vert-test,we
>>             need to use bsd netcat,they are different source.
>>
>>
>>         That was understood, and what I meant by:
>>
>>         "If there are any specific meta-virt requirements for netcat,
>>         we should either use bbappends (and
>>         depend on meta-networking, or use the combo-layer tools to
>>         pull the support directly) or better yet
>>         get them merged into meta-networking."
>>
>>         The solution is not to carry a similar netcat in meta-virt,
>>         but to have a single netcat source, which
>>         is meta-virtualization.
>>
>
>         I don't know I catch you or not
>
>         solution 1:
>         =======
>
>
>         create a bbappend in meta-virt. there are two issue
>         a. they have different licence, one is GPLv2 aother is
>         BSD-3-Clause, I don't know if we are allowed to overwritte the
>         LICENSE
>         b. and they have different PV history, one is 0.71, another is
>         0.89, so this can't be append
>
>         soulution 2:
>         ========
>
>
>         seems you want something like this in meta-networing
>         [lyang0@ala-lpggp2 netcat]$ ls
>         netcat_0.7.1.bb <http://netcat_0.7.1.bb>
>         netcat-openbsd_1.89.bb <http://netcat-openbsd_1.89.bb> netcat.inc
>
>         netcat.inc is something like,below other part(DESCRIPTION
>         HOMEPAGE license SRC_URI) ...will be in there bb file, seems
>         what they can share is little.
>
>         inherit autotools update-alternatives gettext
>
>         do_install_append() {
>                 mv ${D}${bindir}/nc ${D}${bindir}/nc.${PN}
>         }
>
>         ALTERNATIVE_${PN} = "nc"
>         ALTERNATIVE_PRIORITY = "100"
>
>
>     It's solution #2 that would be preferable. Since meta-networking
>     is the provider of the current
>     netcat in the set of yocto layers, it makes sense to not expend
>     time and effort supporting an
>     alternative in meta-virt, but to move the variant that is required
>     into meta-networking.
>
>     It would be even better to break the requirement completely (by
>     changing the tools that have
>     the BSP specific requirement). I haven't dug into it yet, is it
>     arguments/syntax, or purely a
>     licensing issue that creates the requirement ? Given your patch, I
>     think it's the former, but
>     as I said, I haven't gone to look yet.
>
>     .. but breaking the dependency is much easier to say, than to do :)
>
>     The combo layer tools could come into play after we've got the BSD
>     netcat support in
>     meta-networking, and for some reason we can't depend on
>     meta-networking and only need
>     the one package. The combo tools can pull that support of our
>     meta-networking and place
>     it in meta-virt .. in a maintainable way.
>
>
> And in case you haven't found it yet:
>
> https://wiki.yoctoproject.org/wiki/Combo-layer
>


Thanks to point this, I'm trying to learn it, I find if the 
meta-virtuallization is a repo it will init fail. or I miss something

lyang0@pek-lpgtest1:/buildarea1/lyang0/examples/meta-virtualization$ 
~/combo-layer init -c conf/combo-layer.conf
[13:59:16] Repository already initialised, nothing to do.
lyang0@pek-lpgtest1:/buildarea1/lyang0/examples/meta-virtualization$ cat 
conf/combo-layer.conf
[meta-networking]
src_uri = git://github.com/openembedded/meta-oe.git
local_repo_dir = /buildarea1/lyang0/examples/meta-oe/meta-networking
dest_dir = /buildarea1/lyang0/examples/meta-virtualization
last_revision =
file_filter = recipes-support/netcat/netcat_0.7.1.bb

It seems the combo-layer is for user. if so, how user know this layer 
depend on another layer's bb?  or put a readme in this layer.

Lei


> Cheers,
>
> Bruce
>
>
>     Cheers,
>
>     Bruce
>
>
>
>         By the way I don't know what is combo-layer tools
>
>         Lei
>
>
>
>
>
>
>>         There's no rush to merge this, there's no impending releases,
>>         so we should take our time and
>>         unify the support, not create a very similar structure in
>>         meta-virt.
>>
>>         Cheers,
>>
>>         Bruce
>>
>>
>>             Lei
>>
>>             Sent from my iPhone
>>
>>             On 2013-1-6, at 2:44, Bruce Ashfield
>>             <bruce.ashfield@gmail.com
>>             <mailto:bruce.ashfield@gmail.com>> wrote:
>>
>>>
>>>
>>>
>>>             On Sat, Jan 5, 2013 at 9:46 AM, David Nyström
>>>             <david.nystrom@enea.com <mailto:david.nystrom@enea.com>>
>>>             wrote:
>>>
>>>
>>>
>>>                 On 01/05/2013 03:26 PM, lei yang wrote:
>>>
>>>                     On Sat, Jan 5, 2013 at 5:55 AM, David Nyström
>>>                     <david.c.nystrom@gmail.com
>>>                     <mailto:david.c.nystrom@gmail.com>> wrote:
>>>
>>>                         On 01/05/2013 02:43 PM,
>>>                         lei.yang@windriver.com
>>>                         <mailto:lei.yang@windriver.com> wrote:
>>>
>>>
>>>                             From: Lei Yang <lei.yang@windriver.com
>>>                             <mailto:lei.yang@windriver.com>>
>>>
>>>                             I know we have the patches in debian dir
>>>                             in the previous version,
>>>                             but I meet lots of patch error.so I
>>>                             change it to debian.org
>>>                             <http://debian.org> version
>>>
>>>                             The background I do this change is:
>>>                             I'm a kvm tester,without patches it will
>>>                             meet error when I do the migrate
>>>                             testing with  -incoming "exec:nc -l
>>>                             5200" it meets error:
>>>                             "nc: Protocol no available."
>>>
>>>                             You can reproduce it simplely with "nc
>>>                             -l 5200" on your board
>>>
>>>                             Lei
>>>
>>>                             Signed-off-by: Lei Yang
>>>                             <lei.yang@windriver.com
>>>                             <mailto:lei.yang@windriver.com>>
>>>                             ---
>>>
>>>
>>>
>>>                         [snip]
>>>
>>>
>>>                             +do_compile() {
>>>                             +       cd ${S}
>>>                             +        while read line; do patch -p1
>>>                             <debian/patches/$line; done
>>>                             <debian/patches/series
>>>
>>>
>>>
>>>                         Is this line really needed ?
>>>                         I cant seem to find any file called
>>>                         debian/patches/* in ${S}.
>>>
>>>
>>>                     Yes it needed,
>>>                     http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz
>>>                     will be download, and gunzip by bitbake
>>>                     automaticlly, then it find
>>>                     .diff (or patch) it will automatically
>>>                     apply(before I thought only
>>>                     .patch will be applied, now I find .diff will be
>>>                     applied ) then you
>>>                     will see the debian/patches dir  created by .dff
>>>
>>>                     logs:
>>>                     lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ ls
>>>                     build/netcat-openbsd-1.89-r0/netcat-openbsd-1.89.orig/
>>>                     atomicio.c      atomicio.o      Makefile        nc.1
>>>                     netcat.c.orig   openbsd-compat/ .pc/          
>>>                      socks.o
>>>                     atomicio.h      debian/         nc            
>>>                      netcat.c
>>>                     netcat.o        patches/        socks.c
>>>
>>>
>>>
>>>                             +       pkgrel=4
>>>                             +       oe_runmake CFLAGS="$CFLAGS
>>>                             -DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""
>>>
>>>
>>>
>>>                         I assume this has been tested with
>>>                         package_rpm as well.
>>>
>>>
>>>
>>>                     Yes, I'm a tester .welcome any testing work to
>>>                     let me do freely
>>>
>>>                     lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$ cat
>>>                     build/netcat-openbsd-1.89-r0/deploy-rpms/x86_64/netcat-openbsd-
>>>                     netcat-openbsd-1.89-r0.x86_64.rpm
>>>                     netcat-openbsd-dbg-1.89-r0.x86_64.rpm
>>>                     netcat-openbsd-dev-1.89-r0.x86_64.rpm
>>>
>>>
>>>                 Thanks Lei,
>>>                 I'll merge this as soon as I can, I seem to be
>>>                 unable to push at the moment. I'll try to resolv
>>>                 this asap.
>>>
>>>
>>>
>>>             I think we should hold on this merge completely. netcat
>>>             is already covered by meta-networking, so
>>>             we should be consolidating patches and support there.
>>>
>>>             If there are any specific meta-virt requirements for
>>>             netcat, we should either use bbappends (and
>>>             depend on meta-networking, or use the combo-layer tools
>>>             to pull the support directly) or better yet
>>>             get them merged into meta-networking.
>>>
>>>             Cheers,
>>>
>>>             Bruce
>>>
>>>
>>>
>>>
>>>                             +}
>>>                             +
>>>                             +do_install() {
>>>                             +       install -d ${D}${bindir}
>>>                             +       install -m 755 ${S}/nc
>>>                             ${D}${bindir}/nc.${BPN}
>>>                             +}
>>>                             +
>>>                             +ALTERNATIVE_${PN} = "nc"
>>>                             +ALTERNATIVE_PRIORITY = "101"
>>>                             +
>>>                             +BBCLASSEXTEND = "nativesdk"
>>>                             diff --git
>>>                             a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>                             <http://openbsd-netcat_1.6.bb>
>>>                             b/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>                             <http://openbsd-netcat_1.6.bb>
>>>                             deleted file mode 100644
>>>                             index 1ae3f37..0000000
>>>                             ---
>>>                             a/recipes-networking/netcat/openbsd-netcat_1.6.bb
>>>                             <http://openbsd-netcat_1.6.bb>
>>>                             +++ /dev/null
>>>                             @@ -1,29 +0,0 @@
>>>                             -DESCRIPTION = "OpenBSD Netcat"
>>>                             -HOMEPAGE =
>>>                             "http://code.google.com/p/openbsd-netcat/"
>>>                             -SECTION = "console/network"
>>>                             -LICENSE = "BSD-3-Clause"
>>>                             -PR = "r0"
>>>                             -
>>>                             -SRCREV = "5"
>>>                             -
>>>                             -SRC_URI =
>>>                             "svn://openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http
>>>                             <http://openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http>"
>>>                             -S = "${WORKDIR}/trunk"
>>>                             -
>>>                             -inherit update-alternatives gettext
>>>                             -
>>>                             -do_configure[noexec] = "1"
>>>                             -
>>>                             -do_compile() {
>>>                             -       cd ${S}
>>>                             -       oe_runmake
>>>                             -}
>>>                             -
>>>                             -do_install() {
>>>                             -       install -d ${D}${bindir}
>>>                             -       install -m 755 ${S}/nc
>>>                             ${D}${bindir}/nc.${BPN}
>>>                             -}
>>>                             -
>>>                             -ALTERNATIVE_${PN} = "nc"
>>>                             -ALTERNATIVE_PRIORITY = "101"
>>>                             -
>>>                             -BBCLASSEXTEND = "nativesdk"
>>>
>>>
>>>                         _______________________________________________
>>>                         meta-virtualization mailing list
>>>                         meta-virtualization@yoctoproject.org
>>>                         <mailto:meta-virtualization@yoctoproject.org>
>>>                         https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>                     _______________________________________________
>>>                     meta-virtualization mailing list
>>>                     meta-virtualization@yoctoproject.org
>>>                     <mailto:meta-virtualization@yoctoproject.org>
>>>                     https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>                 _______________________________________________
>>>                 meta-virtualization mailing list
>>>                 meta-virtualization@yoctoproject.org
>>>                 <mailto:meta-virtualization@yoctoproject.org>
>>>                 https://lists.yoctoproject.org/listinfo/meta-virtualization
>>>
>>>
>>>
>>>
>>>             -- 
>>>             "Thou shalt not follow the NULL pointer, for chaos and
>>>             madness await thee at its end"
>>
>>
>>
>>
>>         -- 
>>         "Thou shalt not follow the NULL pointer, for chaos and
>>         madness await thee at its end"
>>
>>
>>         _______________________________________________
>>         meta-virtualization mailing list
>>         meta-virtualization@yoctoproject.org  <mailto:meta-virtualization@yoctoproject.org>
>>         https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
>     -- 
>     "Thou shalt not follow the NULL pointer, for chaos and madness
>     await thee at its end"
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------070404050108080406070508
Content-Type: text/html; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta content="text/html; charset=ISO-8859-1"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    On 01/06/2013 11:37 AM, Bruce Ashfield wrote:
    <blockquote
cite="mid:CADkTA4PJDAW85B2sQmJniGVrn3VfZ=D56Peg3Cfjvv3L+x6AuQ@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=ISO-8859-1">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <br>
          <div class="gmail_quote">On Sat, Jan 5, 2013 at 10:00 PM,
            Bruce Ashfield <span dir="ltr">&lt;<a
                moz-do-not-send="true"
                href="mailto:bruce.ashfield@gmail.com" target="_blank">bruce.ashfield@gmail.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div dir="ltr"><br>
                <div class="gmail_extra"><br>
                  <br>
                  <div class="gmail_quote">
                    <div>
                      <div class="h5">On Sat, Jan 5, 2013 at 9:03 PM,
                        Lei Yang <span dir="ltr">&lt;<a
                            moz-do-not-send="true"
                            href="mailto:lei.yang@windriver.com"
                            target="_blank">lei.yang@windriver.com</a>&gt;</span>
                        wrote:<br>
                        <blockquote class="gmail_quote"
                          style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                          <div bgcolor="#FFFFFF" text="#000000">
                            <div> On 01/06/2013 08:53 AM, Bruce Ashfield
                              wrote:
                              <blockquote type="cite">
                                <div dir="ltr"><br>
                                  <div class="gmail_extra"><br>
                                    <br>
                                    <div class="gmail_quote">On Sat, Jan
                                      5, 2013 at 7:28 PM, Lei Yang <span
                                        dir="ltr">&lt;<a
                                          moz-do-not-send="true"
                                          href="mailto:yanglei.fage@gmail.com"
                                          target="_blank">yanglei.fage@gmail.com</a>&gt;</span>
                                      wrote:<br>
                                      <blockquote class="gmail_quote"
                                        style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                                        <div dir="auto">
                                          <div>Hi Bruce&nbsp;</div>
                                          <div><br>
                                          </div>
                                          <div>I checked the netcat with
                                            my phone in meta-networking
                                            ,It's not the bsd netcat,in
                                            libvirt or my vert-test,we
                                            need to use bsd netcat,they
                                            are different source.</div>
                                        </div>
                                      </blockquote>
                                      <div><br>
                                      </div>
                                      <div>That was understood, and what
                                        I meant by:</div>
                                      <div><span
                                          style="color:rgb(80,0,80)"><br>
                                        </span></div>
                                      <div><span
                                          style="color:rgb(80,0,80)">"If
                                          there are any specific
                                          meta-virt requirements for
                                          netcat, we should either use
                                          bbappends (and</span></div>
                                      <div><span
                                          style="color:rgb(80,0,80)">depend
                                          on meta-networking, or use the
                                          combo-layer tools to pull the
                                          support directly) or better</span><span
                                          style="color:rgb(80,0,80)">&nbsp;yet</span></div>
                                      <div><span
                                          style="color:rgb(80,0,80)">get
                                          them merged into
                                          meta-networking."</span></div>
                                      <div><span
                                          style="color:rgb(80,0,80)"><br>
                                        </span></div>
                                      <div><span
                                          style="color:rgb(80,0,80)">The
                                          solution is not to carry a
                                          similar netcat in meta-virt,
                                          but to have a single netcat
                                          source, which</span></div>
                                      <div> <font color="#500050">is
                                          meta-virtualization.</font></div>
                                      <div><font color="#500050"><br>
                                        </font></div>
                                    </div>
                                  </div>
                                </div>
                              </blockquote>
                              <br>
                            </div>
                            I don't know I catch you or not <br>
                            <br>
                            solution 1:<br>
                            =======<br>
                            <br>
                            <br>
                            create a bbappend in meta-virt. there are
                            two issue<br>
                            a. they have different licence, one is GPLv2
                            aother is BSD-3-Clause, I don't know if we
                            are allowed to overwritte the LICENSE<br>
                            b. and they have different PV history, one
                            is 0.71, another is 0.89, so this can't be
                            append <br>
                            <br>
                            soulution 2:<br>
                            ========<br>
                            <br>
                            <br>
                            seems you want something like this in
                            meta-networing <br>
                            [lyang0@ala-lpggp2 netcat]$ ls<br>
                            <a moz-do-not-send="true"
                              href="http://netcat_0.7.1.bb"
                              target="_blank">netcat_0.7.1.bb</a>&nbsp;&nbsp;&nbsp; <a
                              moz-do-not-send="true"
                              href="http://netcat-openbsd_1.89.bb"
                              target="_blank">netcat-openbsd_1.89.bb</a>
                            netcat.inc<br>
                            <br>
                            netcat.inc is something like,below other
                            part(DESCRIPTION HOMEPAGE license SRC_URI)
                            ...will be in there bb file, seems what they
                            can share is little.<br>
                            <br>
                            inherit autotools update-alternatives
                            gettext<br>
                            <br>
                            do_install_append() {<br>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mv ${D}${bindir}/nc
                            ${D}${bindir}/nc.${PN}<br>
                            }<br>
                            <br>
                            ALTERNATIVE_${PN} = "nc"<br>
                            ALTERNATIVE_PRIORITY = "100"<br>
                          </div>
                        </blockquote>
                        <div><br>
                        </div>
                      </div>
                    </div>
                    <div>It's solution #2 that would be preferable.
                      Since meta-networking is the provider of the
                      current</div>
                    <div>netcat in the set of yocto layers, it makes
                      sense to not expend time and effort supporting an</div>
                    <div>alternative in meta-virt, but to move the
                      variant that is required into meta-networking.</div>
                    <div><br>
                    </div>
                    <div>It would be even better to break the
                      requirement completely (by changing the tools that
                      have</div>
                    <div>the BSP specific requirement). I haven't dug
                      into it yet, is it arguments/syntax, or purely a&nbsp;</div>
                    <div>licensing issue that creates the requirement ?
                      Given your patch, I think it's the former, but</div>
                    <div>as I said, I haven't gone to look yet.</div>
                    <div><br>
                    </div>
                    <div>.. but breaking the dependency is much easier
                      to say, than to do :)</div>
                    <div><br>
                    </div>
                    <div>The combo layer tools could come into play
                      after we've got the BSD netcat support in&nbsp;</div>
                    <div>meta-networking, and for some reason we can't
                      depend on meta-networking and only need</div>
                    <div>the one package. The combo tools can pull that
                      support of our meta-networking and place</div>
                    <div>
                      it in meta-virt .. in a maintainable way.</div>
                  </div>
                </div>
              </div>
            </blockquote>
            <div><br>
            </div>
            <div style="">And in case you haven't found it yet:</div>
            <div style=""><br>
            </div>
            <div style=""><a moz-do-not-send="true"
                href="https://wiki.yoctoproject.org/wiki/Combo-layer">https://wiki.yoctoproject.org/wiki/Combo-layer</a><br>
            </div>
            <div style=""><br>
            </div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    <br>
    Thanks to point this, I'm trying to learn it, I find if the
    meta-virtuallization is a repo it will init fail. or I miss
    something<br>
    <br>
    lyang0@pek-lpgtest1:/buildarea1/lyang0/examples/meta-virtualization$
    ~/combo-layer init -c conf/combo-layer.conf <br>
    [13:59:16] Repository already initialised, nothing to do.<br>
    lyang0@pek-lpgtest1:/buildarea1/lyang0/examples/meta-virtualization$
    cat conf/combo-layer.conf <br>
    [meta-networking]<br>
    src_uri = git://github.com/openembedded/meta-oe.git<br>
    local_repo_dir = /buildarea1/lyang0/examples/meta-oe/meta-networking<br>
    dest_dir = /buildarea1/lyang0/examples/meta-virtualization<br>
    last_revision =<br>
    file_filter = recipes-support/netcat/netcat_0.7.1.bb<br>
    <br>
    It seems the combo-layer is for user. if so, how user know this
    layer depend on another layer's bb?&nbsp; or put a readme in this layer.<br>
    <br>
    Lei<br>
    <br>
    <br>
    <blockquote
cite="mid:CADkTA4PJDAW85B2sQmJniGVrn3VfZ=D56Peg3Cfjvv3L+x6AuQ@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div style="">Cheers,</div>
            <div style=""><br>
            </div>
            <div style="">Bruce</div>
            <div>&nbsp;</div>
            <blockquote class="gmail_quote" style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
              <div dir="ltr">
                <div class="gmail_extra">
                  <div class="gmail_quote">
                    <div><br>
                    </div>
                    <div>Cheers,</div>
                    <div><br>
                    </div>
                    <div>Bruce</div>
                    <div>
                      <div class="h5">
                        <div><br>
                        </div>
                        <blockquote class="gmail_quote"
                          style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                          <div bgcolor="#FFFFFF" text="#000000"> <br>
                            <br>
                            By the way I don't know what is <span
                              style="color:rgb(80,0,80)">combo-layer
                              tools </span><br>
                            <br>
                            Lei
                            <div>
                              <div><br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <br>
                                <blockquote type="cite">
                                  <div dir="ltr">
                                    <div class="gmail_extra">
                                      <div class="gmail_quote">
                                        <div><font color="#500050">There's
                                            no rush to merge this,
                                            there's no impending
                                            releases, so we should take
                                            our time and</font></div>
                                        <div><font color="#500050">unify
                                            the support, not create a
                                            very similar structure in
                                            meta-virt.</font></div>
                                        <div><font color="#500050"><br>
                                          </font></div>
                                        <div><font color="#500050">Cheers,</font></div>
                                        <div> <font color="#500050"><br>
                                          </font></div>
                                        <div><font color="#500050">Bruce</font></div>
                                        <div><br>
                                        </div>
                                        <div>&nbsp;</div>
                                        <blockquote class="gmail_quote"
                                          style="margin:0px 0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                                          <div dir="auto">
                                            <div><br>
                                            </div>
                                            <div>Lei<br>
                                              <br></div>
                                            <div>
                                              <div>
                                                <div><br>
                                                  On 2013-1-6, at 2:44,
                                                  Bruce Ashfield &lt;<a
moz-do-not-send="true" href="mailto:bruce.ashfield@gmail.com"
                                                    target="_blank">bruce.ashfield@gmail.com</a>&gt;

                                                  wrote:<br>
                                                  <br>
                                                </div>
                                                <blockquote type="cite">
                                                  <div>
                                                    <div dir="ltr"><br>
                                                      <div
                                                        class="gmail_extra"><br>
                                                        <br>
                                                        <div
                                                          class="gmail_quote">On
                                                          Sat, Jan 5,
                                                          2013 at 9:46
                                                          AM, David
                                                          Nystr&ouml;m <span
                                                          dir="ltr">&lt;<a
moz-do-not-send="true" href="mailto:david.nystrom@enea.com"
                                                          target="_blank">david.nystrom@enea.com</a>&gt;</span>
                                                          wrote:<br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                                                          <div>
                                                          <div><br>
                                                          <br>
                                                          On 01/05/2013
                                                          03:26 PM, lei
                                                          yang wrote:<br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">On

                                                          Sat, Jan 5,
                                                          2013 at 5:55
                                                          AM, David
                                                          Nystr&ouml;m &lt;<a
moz-do-not-send="true" href="mailto:david.c.nystrom@gmail.com"
                                                          target="_blank">david.c.nystrom@gmail.com</a>&gt;

                                                          wrote:<br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">On

                                                          01/05/2013
                                                          02:43 PM, <a
moz-do-not-send="true" href="mailto:lei.yang@windriver.com"
                                                          target="_blank">lei.yang@windriver.com</a>
                                                          wrote:<br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><br>
                                                          From: Lei Yang
                                                          &lt;<a
                                                          moz-do-not-send="true"
href="mailto:lei.yang@windriver.com" target="_blank">lei.yang@windriver.com</a>&gt;<br>
                                                          <br>
                                                          I know we have
                                                          the patches in
                                                          debian dir in
                                                          the previous
                                                          version,<br>
                                                          but I meet
                                                          lots of patch
                                                          error.so I
                                                          change it to <a
moz-do-not-send="true" href="http://debian.org" target="_blank">debian.org</a>
                                                          version<br>
                                                          <br>
                                                          The background
                                                          I do this
                                                          change is:<br>
                                                          I'm a kvm
                                                          tester,without
                                                          patches it
                                                          will meet
                                                          error when I
                                                          do the migrate<br>
                                                          testing with
                                                          &nbsp;-incoming
                                                          "exec:nc -l
                                                          5200" it meets
                                                          error:<br>
                                                          "nc: Protocol
                                                          no available."<br>
                                                          <br>
                                                          You can
                                                          reproduce it
                                                          simplely with
                                                          "nc -l 5200"
                                                          on your board<br>
                                                          <br>
                                                          Lei<br>
                                                          <br>
                                                          Signed-off-by:
                                                          Lei Yang &lt;<a
moz-do-not-send="true" href="mailto:lei.yang@windriver.com"
                                                          target="_blank">lei.yang@windriver.com</a>&gt;<br>
                                                          ---<br>
                                                          </blockquote>
                                                          <br>
                                                          <br>
                                                          [snip]<br>
                                                          <br>
                                                          <br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+do_compile()

                                                          {<br>
                                                          + &nbsp; &nbsp; &nbsp; cd
                                                          ${S}<br>
                                                          + &nbsp; &nbsp; &nbsp; &nbsp;while
                                                          read line; do
                                                          patch -p1
                                                          &lt;debian/patches/$line;
                                                          done<br>
&lt;debian/patches/series<br>
                                                          </blockquote>
                                                          <br>
                                                          <br>
                                                          Is this line
                                                          really needed
                                                          ?<br>
                                                          I cant seem to
                                                          find any file
                                                          called
                                                          debian/patches/*
                                                          in ${S}.<br>
                                                          <br>
                                                          </blockquote>
                                                          <br>
                                                          Yes it needed,
                                                          <a
                                                          moz-do-not-send="true"
href="http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz"
target="_blank">http://ftp.debian.org/debian/pool/main/n/netcat-openbsd/netcat-openbsd_1.89-4.diff.gz</a><br>
                                                          will be
                                                          download, and
                                                          gunzip by
                                                          bitbake
                                                          automaticlly,
                                                          then it find<br>
                                                          .diff (or
                                                          patch) it will
                                                          automatically
                                                          apply(before I
                                                          thought only<br>
                                                          .patch will be
                                                          applied, now I
                                                          find .diff
                                                          will be
                                                          applied ) then
                                                          you<br>
                                                          will see the
                                                          debian/patches
                                                          dir &nbsp;created
                                                          by .dff<br>
                                                          <br>
                                                          logs:<br>
                                                          lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$

                                                          ls<br>
build/netcat-openbsd-1.89-r0/netcat-openbsd-1.89.orig/<br>
                                                          atomicio.c &nbsp; &nbsp;
                                                          &nbsp;atomicio.o &nbsp;
                                                          &nbsp; &nbsp;Makefile &nbsp;
                                                          &nbsp; &nbsp; &nbsp;nc.1<br>
                                                          netcat.c.orig
                                                          &nbsp;
                                                          openbsd-compat/
                                                          .pc/ &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                          &nbsp;socks.o<br>
                                                          atomicio.h &nbsp; &nbsp;
                                                          &nbsp;debian/ &nbsp; &nbsp; &nbsp;
                                                          &nbsp; nc &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                                                          &nbsp; &nbsp;netcat.c<br>
                                                          netcat.o &nbsp; &nbsp; &nbsp;
                                                          &nbsp;patches/ &nbsp; &nbsp;
                                                          &nbsp; &nbsp;socks.c<br>
                                                          <br>
                                                          <br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+
                                                          &nbsp; &nbsp; &nbsp; pkgrel=4<br>
                                                          + &nbsp; &nbsp; &nbsp;
                                                          oe_runmake
                                                          CFLAGS="$CFLAGS
-DDEBIAN_VERSION=\"\\\"${pkgrel}\\\"\""<br>
                                                          </blockquote>
                                                          <br>
                                                          <br>
                                                          I assume this
                                                          has been
                                                          tested with
                                                          package_rpm as
                                                          well.<br>
                                                          <br>
                                                          <br>
                                                          </blockquote>
                                                          <br>
                                                          Yes, I'm a
                                                          tester
                                                          .welcome any
                                                          testing work
                                                          to let me do
                                                          freely<br>
                                                          <br>
                                                          lyang0@pek-lpgtest1:/buildarea1/lyang0/kvm_rr$

                                                          cat<br>
build/netcat-openbsd-1.89-r0/deploy-rpms/x86_64/netcat-openbsd-<br>
netcat-openbsd-1.89-r0.x86_64.rpm<br>
netcat-openbsd-dbg-1.89-r0.x86_64.rpm<br>
netcat-openbsd-dev-1.89-r0.x86_64.rpm<br>
                                                          <br>
                                                          </blockquote>
                                                          <br>
                                                          </div>
                                                          </div>
                                                          Thanks Lei,<br>
                                                          I'll merge
                                                          this as soon
                                                          as I can, I
                                                          seem to be
                                                          unable to push
                                                          at the moment.
                                                          I'll try to
                                                          resolv this
                                                          asap.
                                                          <div>
                                                          <div><br>
                                                          <br>
                                                          </div>
                                                          </div>
                                                          </blockquote>
                                                          <div><br>
                                                          </div>
                                                          <div>I think
                                                          we should hold
                                                          on this merge
                                                          completely.
                                                          netcat is
                                                          already
                                                          covered by
                                                          meta-networking,
                                                          so</div>
                                                          <div>we should
                                                          be
                                                          consolidating
                                                          patches and
                                                          support there.</div>
                                                          <div><br>
                                                          </div>
                                                          <div>If there
                                                          are any
                                                          specific
                                                          meta-virt
                                                          requirements
                                                          for netcat, we
                                                          should either
                                                          use bbappends
                                                          (and</div>
                                                          <div>depend on
                                                          meta-networking,
                                                          or use the
                                                          combo-layer
                                                          tools to pull
                                                          the support
                                                          directly) or
                                                          better yet</div>
                                                          <div>get them
                                                          merged into
                                                          meta-networking.</div>
                                                          <div><br>
                                                          </div>
                                                          <div>Cheers,</div>
                                                          <div><br>
                                                          </div>
                                                          <div>Bruce</div>
                                                          <div>&nbsp;</div>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                                                          <div>
                                                          <div>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex"><br>
                                                          <br>
                                                          <br>
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">
                                                          <blockquote
                                                          class="gmail_quote"
                                                          style="margin:0px
                                                          0px 0px
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left-style:solid;padding-left:1ex">+}<br>
                                                          +<br>
                                                          +do_install()
                                                          {<br>
                                                          + &nbsp; &nbsp; &nbsp;
                                                          install -d
                                                          ${D}${bindir}<br>
                                                          + &nbsp; &nbsp; &nbsp;
                                                          install -m 755
                                                          ${S}/nc
                                                          ${D}${bindir}/nc.${BPN}<br>
                                                          +}<br>
                                                          +<br>
                                                          +ALTERNATIVE_${PN}
                                                          = "nc"<br>
                                                          +ALTERNATIVE_PRIORITY
                                                          = "101"<br>
                                                          +<br>
                                                          +BBCLASSEXTEND
                                                          = "nativesdk"<br>
                                                          diff --git
                                                          a/recipes-networking/netcat/<a
moz-do-not-send="true" href="http://openbsd-netcat_1.6.bb"
                                                          target="_blank">openbsd-netcat_1.6.bb</a><br>
b/recipes-networking/netcat/<a moz-do-not-send="true"
                                                          href="http://openbsd-netcat_1.6.bb"
target="_blank">openbsd-netcat_1.6.bb</a><br>
                                                          deleted file
                                                          mode 100644<br>
                                                          index
                                                          1ae3f37..0000000<br>
                                                          ---
                                                          a/recipes-networking/netcat/<a
moz-do-not-send="true" href="http://openbsd-netcat_1.6.bb"
                                                          target="_blank">openbsd-netcat_1.6.bb</a><br>
                                                          +++ /dev/null<br>
                                                          @@ -1,29 +0,0
                                                          @@<br>
                                                          -DESCRIPTION =
                                                          "OpenBSD
                                                          Netcat"<br>
                                                          -HOMEPAGE = "<a
moz-do-not-send="true" href="http://code.google.com/p/openbsd-netcat/"
                                                          target="_blank">http://code.google.com/p/openbsd-netcat/</a>"<br>
                                                          -SECTION =
                                                          "console/network"<br>
                                                          -LICENSE =
                                                          "BSD-3-Clause"<br>
                                                          -PR = "r0"<br>
                                                          -<br>
                                                          -SRCREV = "5"<br>
                                                          -<br>
                                                          -SRC_URI =<br>
                                                          "svn://<a
                                                          moz-do-not-send="true"
href="http://openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http"
target="_blank">openbsd-netcat.googlecode.com/svn;module=trunk;protocol=http</a>"<br>
                                                          -S =
                                                          "${WORKDIR}/trunk"<br>
                                                          -<br>
                                                          -inherit
                                                          update-alternatives
                                                          gettext<br>
                                                          -<br>
                                                          -do_configure[noexec]
                                                          = "1"<br>
                                                          -<br>
                                                          -do_compile()
                                                          {<br>
                                                          - &nbsp; &nbsp; &nbsp; cd
                                                          ${S}<br>
                                                          - &nbsp; &nbsp; &nbsp;
                                                          oe_runmake<br>
                                                          -}<br>
                                                          -<br>
                                                          -do_install()
                                                          {<br>
                                                          - &nbsp; &nbsp; &nbsp;
                                                          install -d
                                                          ${D}${bindir}<br>
                                                          - &nbsp; &nbsp; &nbsp;
                                                          install -m 755
                                                          ${S}/nc
                                                          ${D}${bindir}/nc.${BPN}<br>
                                                          -}<br>
                                                          -<br>
                                                          -ALTERNATIVE_${PN}
                                                          = "nc"<br>
                                                          -ALTERNATIVE_PRIORITY
                                                          = "101"<br>
                                                          -<br>
                                                          -BBCLASSEXTEND
                                                          = "nativesdk"<br>
                                                          <br>
                                                          </blockquote>
                                                          <br>
_______________________________________________<br>
                                                          meta-virtualization
                                                          mailing list<br>
                                                          <a
                                                          moz-do-not-send="true"
href="mailto:meta-virtualization@yoctoproject.org" target="_blank">meta-virtualization@yoctoproject.org</a><br>
                                                          <a
                                                          moz-do-not-send="true"
href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                                                          target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
                                                          </blockquote>
_______________________________________________<br>
                                                          meta-virtualization
                                                          mailing list<br>
                                                          <a
                                                          moz-do-not-send="true"
href="mailto:meta-virtualization@yoctoproject.org" target="_blank">meta-virtualization@yoctoproject.org</a><br>
                                                          <a
                                                          moz-do-not-send="true"
href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                                                          target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
                                                          <br>
                                                          </blockquote>
_______________________________________________<br>
                                                          meta-virtualization
                                                          mailing list<br>
                                                          <a
                                                          moz-do-not-send="true"
href="mailto:meta-virtualization@yoctoproject.org" target="_blank">meta-virtualization@yoctoproject.org</a><br>
                                                          <a
                                                          moz-do-not-send="true"
href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                                                          target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
                                                          </div>
                                                          </div>
                                                          </blockquote>
                                                        </div>
                                                        <br>
                                                        <br clear="all">
                                                        <div><br>
                                                        </div>
                                                        -- <br>
                                                        "Thou shalt not
                                                        follow the NULL
                                                        pointer, for
                                                        chaos and
                                                        madness await
                                                        thee at its end"
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
                                      <br clear="all">
                                      <div><br>
                                      </div>
                                      -- <br>
                                      "Thou shalt not follow the NULL
                                      pointer, for chaos and madness
                                      await thee at its end" </div>
                                  </div>
                                  <br>
                                  <fieldset></fieldset>
                                  <br>
                                  <pre>_______________________________________________
meta-virtualization mailing list
<a moz-do-not-send="true" href="mailto:meta-virtualization@yoctoproject.org" target="_blank">meta-virtualization@yoctoproject.org</a>
<a moz-do-not-send="true" href="https://lists.yoctoproject.org/listinfo/meta-virtualization" target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a>
</pre>
                                </blockquote>
                                <br>
                              </div>
                            </div>
                          </div>
                        </blockquote>
                      </div>
                    </div>
                  </div>
                  <div>
                    <div class="h5"><br>
                      <br clear="all">
                      <div><br>
                      </div>
                      -- <br>
                      "Thou shalt not follow the NULL pointer, for chaos
                      and madness await thee at its end"
                    </div>
                  </div>
                </div>
              </div>
            </blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          "Thou shalt not follow the NULL pointer, for chaos and madness
          await thee at its end"
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------070404050108080406070508--

Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id BA2EAE00D46; Mon,  5 Aug 2019 04:52:49 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [192.103.53.11 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 00677E00A93
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 04:52:48 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x75BqBE0005543
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Aug 2019 04:52:21 -0700
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 5 Aug 2019 04:52:00 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190805060143.24108-1-Qi.Chen@windriver.com>
	<20190805060143.24108-2-Qi.Chen@windriver.com>
	<CADkTA4OYhWqw_nRRYx4=mjz2Pasxude6sPQyhiaWFwBuRYK2Gg@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <62ce21c1-d9c9-7c83-5282-793c1a055f3f@windriver.com>
Date: Mon, 5 Aug 2019 20:05:15 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4OYhWqw_nRRYx4=mjz2Pasxude6sPQyhiaWFwBuRYK2Gg@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 2/4] runc: remove static to enable building systemd support
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
X-List-Received-Date: Mon, 05 Aug 2019 11:52:49 -0000
Content-Type: multipart/alternative;
	boundary="------------9AC445EF57B985586D1D8043"

--------------9AC445EF57B985586D1D8043
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/05/2019 07:28 PM, Bruce Ashfield wrote:
>
>
> On Mon., Aug. 5, 2019, 3:02 a.m. Chen Qi, <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Remove the 'static' from do_compile to enable systemd support.
>     This avoid runtime error is docker's cgroup driver is set to systemd
>     on systemd based images.
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      recipes-containers/runc/runc.inc | 2 +-
>      1 file changed, 1 insertion(+), 1 deletion(-)
>
>     diff --git a/recipes-containers/runc/runc.inc
>     b/recipes-containers/runc/runc.inc
>     index 46fd09d..1f2f944 100644
>     --- a/recipes-containers/runc/runc.inc
>     +++ b/recipes-containers/runc/runc.inc
>     @@ -54,7 +54,7 @@ do_compile() {
>             export CFLAGS=""
>             export LDFLAGS=""
>
>     -       oe_runmake static
>     +       oe_runmake
>
>
>
> This needs to be optional, via a packageconfig that can be overidden 
> and that can trigger a default of the init manager is systemd. (I 
> actually want static and systemd in my configs )
>
> Bruce
>

So we introduce a PACKAGECONFIG, whose effect is using static when 
enabled and dropping static when disabled. By default, it's disabled if 
systemd is in use.

Right?

Regards,
Chen Qi

>      }
>
>      do_install() {
>     -- 
>     2.17.1
>
>     -- 
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>


--------------9AC445EF57B985586D1D8043
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/05/2019 07:28 PM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4OYhWqw_nRRYx4=mjz2Pasxude6sPQyhiaWFwBuRYK2Gg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="auto">
        <div><br>
          <br>
          <div class="gmail_quote">
            <div dir="ltr" class="gmail_attr">On Mon., Aug. 5, 2019,
              3:02 a.m. Chen Qi, &lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
              wrote:<br>
            </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Remove
              the 'static' from do_compile to enable systemd support.<br>
              This avoid runtime error is docker's cgroup driver is set
              to systemd<br>
              on systemd based images.<br>
              <br>
              Signed-off-by: Chen Qi &lt;<a moz-do-not-send="true"
                href="mailto:Qi.Chen@windriver.com" target="_blank"
                rel="noreferrer">Qi.Chen@windriver.com</a>&gt;<br>
              ---<br>
               recipes-containers/runc/runc.inc | 2 +-<br>
               1 file changed, 1 insertion(+), 1 deletion(-)<br>
              <br>
              diff --git a/recipes-containers/runc/runc.inc
              b/recipes-containers/runc/runc.inc<br>
              index 46fd09d..1f2f944 100644<br>
              --- a/recipes-containers/runc/runc.inc<br>
              +++ b/recipes-containers/runc/runc.inc<br>
              @@ -54,7 +54,7 @@ do_compile() {<br>
                      export CFLAGS=""<br>
                      export LDFLAGS=""<br>
              <br>
              -       oe_runmake static<br>
              +       oe_runmake<br>
            </blockquote>
          </div>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">This needs to be optional, via a packageconfig
          that can be overidden and that can trigger a default of the
          init manager is systemd. (I actually want static and systemd
          in my configs )</div>
        <div dir="auto"><br>
        </div>
        <div dir="auto">Bruce</div>
        <div dir="auto"><br>
        </div>
      </div>
    </blockquote>
    <br>
    So we introduce a PACKAGECONFIG, whose effect is using static when
    enabled and dropping static when disabled. By default, it's disabled
    if systemd is in use.<br>
    <br>
    Right?<br>
    <br>
    Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CADkTA4OYhWqw_nRRYx4=mjz2Pasxude6sPQyhiaWFwBuRYK2Gg@mail.gmail.com"
      type="cite">
      <div dir="auto">
        <div dir="auto">
          <div class="gmail_quote">
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
               }<br>
              <br>
               do_install() {<br>
              -- <br>
              2.17.1<br>
              <br>
              -- <br>
              _______________________________________________<br>
              meta-virtualization mailing list<br>
              <a moz-do-not-send="true"
                href="mailto:meta-virtualization@yoctoproject.org"
                target="_blank" rel="noreferrer">meta-virtualization@yoctoproject.org</a><br>
              <a moz-do-not-send="true"
                href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                rel="noreferrer noreferrer" target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
            </blockquote>
          </div>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------9AC445EF57B985586D1D8043--

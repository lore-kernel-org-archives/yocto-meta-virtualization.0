Return-Path: <Zumeng.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 8CF29E00DFB; Sun, 22 May 2016 18:11:40 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 516F5E00C15
	for <meta-virtualization@yoctoproject.org>;
	Sun, 22 May 2016 18:11:36 -0700 (PDT)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u4N1BYqZ025754
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 22 May 2016 18:11:34 -0700
Received: from pek-zchen-l1.corp.ad.wrs.com (128.224.162.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Sun, 22 May 2016 18:11:33 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1463727448-32195-1-git-send-email-zumeng.chen@windriver.com>
	<CADkTA4PWOvm1mfOsaa1pq4R6BgpSMH0Wkc3mWzpF+25RazF_Cg@mail.gmail.com>
From: Zumeng Chen <zumeng.chen@windriver.com>
Message-ID: <574258C4.3040702@windriver.com>
Date: Mon, 23 May 2016 09:11:32 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PWOvm1mfOsaa1pq4R6BgpSMH0Wkc3mWzpF+25RazF_Cg@mail.gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: Two patches for protobuf and criu
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
X-List-Received-Date: Mon, 23 May 2016 01:11:40 -0000
Content-Type: multipart/alternative;
	boundary="------------000609000308050901040709"

--------------000609000308050901040709
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2016年05月21日 00:38, Bruce Ashfield wrote:
>
>
> On Fri, May 20, 2016 at 2:57 AM, Zumeng Chen 
> <zumeng.chen@windriver.com <mailto:zumeng.chen@windriver.com>> wrote:
>
>     Hi Bruce,
>
>     I wonder if these two patches are fit for meta-virtualization, please
>     help me to take a look, thanks a lot~
>
>
> I've merged both patches to master.

Thanks a lot ~~

>
> I'm in the process of trying to drop protobuf* from 
> meta-virtualization since it is now being
> updated in meta-oe. But meta-oe is at 2.6.1 which won't serve the 
> needs of meta-virt .. so
> the dropping of the same version in meta-oe (2.6.1) and the 
> re-introduction of 2.5.x makes
> sense.

Agreed,

Cheers,
Zumeng
>
> Bruce
>
>
>     Cheers,
>     Zumeng
>
>     --
>     _______________________________________________
>     meta-virtualization mailing list
>     meta-virtualization@yoctoproject.org
>     <mailto:meta-virtualization@yoctoproject.org>
>     https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> -- 
> "Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end"


--------------000609000308050901040709
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 2016年05月21日 00:38, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4PWOvm1mfOsaa1pq4R6BgpSMH0Wkc3mWzpF+25RazF_Cg@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr"><br>
        <div class="gmail_extra"><br>
          <div class="gmail_quote">On Fri, May 20, 2016 at 2:57 AM,
            Zumeng Chen <span dir="ltr">&lt;<a moz-do-not-send="true"
                href="mailto:zumeng.chen@windriver.com" target="_blank">zumeng.chen@windriver.com</a>&gt;</span>
            wrote:<br>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">Hi
              Bruce,<br>
              <br>
              I wonder if these two patches are fit for
              meta-virtualization, please<br>
              help me to take a look, thanks a lot~<br>
            </blockquote>
            <div><br>
            </div>
            <div>I've merged both patches to master.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Thanks a lot ~~ <br>
    <br>
    <blockquote
cite="mid:CADkTA4PWOvm1mfOsaa1pq4R6BgpSMH0Wkc3mWzpF+25RazF_Cg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>I'm in the process of trying to drop protobuf* from
              meta-virtualization since it is now being</div>
            <div>updated in meta-oe. But meta-oe is at 2.6.1 which won't
              serve the needs of meta-virt .. so</div>
            <div>the dropping of the same version in meta-oe (2.6.1) and
              the re-introduction of 2.5.x makes</div>
            <div>sense.</div>
          </div>
        </div>
      </div>
    </blockquote>
    <br>
    Agreed,<br>
    <br>
    Cheers,<br>
    Zumeng<br>
    <blockquote
cite="mid:CADkTA4PWOvm1mfOsaa1pq4R6BgpSMH0Wkc3mWzpF+25RazF_Cg@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div class="gmail_extra">
          <div class="gmail_quote">
            <div><br>
            </div>
            <div>Bruce</div>
            <div> </div>
            <blockquote class="gmail_quote" style="margin:0 0 0
              .8ex;border-left:1px #ccc solid;padding-left:1ex">
              <br>
              Cheers,<br>
              Zumeng<br>
              <span class="HOEnZb"><font color="#888888"><br>
                  --<br>
                  _______________________________________________<br>
                  meta-virtualization mailing list<br>
                  <a moz-do-not-send="true"
                    href="mailto:meta-virtualization@yoctoproject.org">meta-virtualization@yoctoproject.org</a><br>
                  <a moz-do-not-send="true"
                    href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
                    rel="noreferrer" target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
                </font></span></blockquote>
          </div>
          <br>
          <br clear="all">
          <div><br>
          </div>
          -- <br>
          <div class="gmail_signature">"Thou shalt not follow the NULL
            pointer, for chaos and madness await thee at its end"</div>
        </div>
      </div>
    </blockquote>
    <br>
  </body>
</html>

--------------000609000308050901040709--

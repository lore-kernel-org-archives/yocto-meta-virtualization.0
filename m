Return-Path: <Qi.Chen@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0B49CE00D35; Mon,  5 Aug 2019 18:33:30 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D4408E00A75
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Aug 2019 18:33:28 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x761XRiW019126
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 5 Aug 2019 18:33:27 -0700 (PDT)
Received: from [128.224.162.148] (128.224.162.148) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.468.0;
	Mon, 5 Aug 2019 18:33:26 -0700
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <20190805115610.29854-1-Qi.Chen@windriver.com>
	<CADkTA4PrJuT8wxwGeFGTztsyD0j8veTqXF1W37g77y9Te2X-Lw@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <32c9eb50-cc5d-2dd9-ed54-a60b957a1a9a@windriver.com>
Date: Tue, 6 Aug 2019 09:46:41 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CADkTA4PrJuT8wxwGeFGTztsyD0j8veTqXF1W37g77y9Te2X-Lw@mail.gmail.com>
X-Originating-IP: [128.224.162.148]
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] .gitignore: ignore .patch files
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
X-List-Received-Date: Tue, 06 Aug 2019 01:33:30 -0000
Content-Type: multipart/alternative;
	boundary="------------5377CCE4169716179458DC62"

--------------5377CCE4169716179458DC62
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 08/06/2019 09:04 AM, Bruce Ashfield wrote:
> Not that I fundamentally disagree with the patch .. but why would we 
> want to .gitignore patches ? I personally want them to be picked up as 
> changed, or if they've been dropped in the wrong directory.
Sorry. I meant to ignore patches in top dir of meta-virtualization. It 
should be /*.patch like in oe-core and meta-openembedded's .gitignore. 
I'll send out V2.

Best Regards,
Chen Qi

>
> Bruce
>
> On Mon, Aug 5, 2019 at 8:56 AM Chen Qi <Qi.Chen@windriver.com 
> <mailto:Qi.Chen@windriver.com>> wrote:
>
>     Signed-off-by: Chen Qi <Qi.Chen@windriver.com
>     <mailto:Qi.Chen@windriver.com>>
>     ---
>      .gitignore | 1 +
>      1 file changed, 1 insertion(+)
>
>     diff --git a/.gitignore b/.gitignore
>     index 65feb82..f0047e5 100644
>     --- a/.gitignore
>     +++ b/.gitignore
>     @@ -3,4 +3,5 @@ pyshtables.py
>      *.swp
>      *.orig
>      *.rej
>     +*.patch
>      *~
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
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>


--------------5377CCE4169716179458DC62
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <div class="moz-cite-prefix">On 08/06/2019 09:04 AM, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote
cite="mid:CADkTA4PrJuT8wxwGeFGTztsyD0j8veTqXF1W37g77y9Te2X-Lw@mail.gmail.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small">Not that I
            fundamentally disagree with the patch .. but why would we
            want to .gitignore patches ? I personally want them to be
            picked up as changed, or if they've been dropped in the
            wrong directory.</div>
        </div>
      </div>
    </blockquote>
    Sorry. I meant to ignore patches in top dir of meta-virtualization.
    It should be /*.patch like in oe-core and meta-openembedded's
    .gitignore. I'll send out V2.<br>
    <br>
    Best Regards,<br>
    Chen Qi<br>
    <br>
    <blockquote
cite="mid:CADkTA4PrJuT8wxwGeFGTztsyD0j8veTqXF1W37g77y9Te2X-Lw@mail.gmail.com"
      type="cite">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">Bruce</div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Mon, Aug 5, 2019 at 8:56
            AM Chen Qi &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote" style="margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">Signed-off-by: Chen Qi
            &lt;<a moz-do-not-send="true"
              href="mailto:Qi.Chen@windriver.com" target="_blank">Qi.Chen@windriver.com</a>&gt;<br>
            ---<br>
             .gitignore | 1 +<br>
             1 file changed, 1 insertion(+)<br>
            <br>
            diff --git a/.gitignore b/.gitignore<br>
            index 65feb82..f0047e5 100644<br>
            --- a/.gitignore<br>
            +++ b/.gitignore<br>
            @@ -3,4 +3,5 @@ pyshtables.py<br>
             *.swp<br>
             *.orig<br>
             *.rej<br>
            +*.patch<br>
             *~<br>
            -- <br>
            2.17.1<br>
            <br>
            -- <br>
            _______________________________________________<br>
            meta-virtualization mailing list<br>
            <a moz-do-not-send="true"
              href="mailto:meta-virtualization@yoctoproject.org"
              target="_blank">meta-virtualization@yoctoproject.org</a><br>
            <a moz-do-not-send="true"
              href="https://lists.yoctoproject.org/listinfo/meta-virtualization"
              rel="noreferrer" target="_blank">https://lists.yoctoproject.org/listinfo/meta-virtualization</a><br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        -- <br>
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - "Use the force Harry" - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
    <p><br>
    </p>
  </body>
</html>

--------------5377CCE4169716179458DC62--

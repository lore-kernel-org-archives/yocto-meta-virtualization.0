Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BE27E00D68; Tue,  1 Oct 2019 13:58:33 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B4ED6E00CB9
	for <meta-virtualization@yoctoproject.org>;
	Tue,  1 Oct 2019 13:58:31 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id y3so14866578ljj.6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 01 Oct 2019 13:58:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Fho2y4lG2qBREb2en4trk6BxD7C0UMwgYOF9fM4IWg0=;
	b=lmojea+NI8bAQNQmXqlHNPEj70bXk56bHlukmSR0w12dg7ZzXFkYP79l7zNaJ/oEi6
	bg/n+70A8yDR0TJsIM9bb4U+e+ZaM16cY1+eIy3iYAcGpvPBU3yzr+sEsTIMEylHJtTX
	/5+ZPrOHXr8RLYBuG8eClHtljwthPakO8c+O3uv1SE3+VTlBhtDLQa+1O9i+rHHOUN6H
	AcGACKYSB8vU9WNSpv7R+c2d8ISBKokHYyyea+8OyxlQV+d5tffP9Uhj58eeVXVZZ9x8
	HUc+OoiyzVSx0sHz5TEkb++xgSgtBUip59WjTrZxve5+ux035+3UK9uAI7ntrzYYQhAT
	WnJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Fho2y4lG2qBREb2en4trk6BxD7C0UMwgYOF9fM4IWg0=;
	b=j6qXnFLdXvXK2SYwe8JLp9Zn6iAK8HeJy41IjTJl3M6KprWyOfEbt5M3Em3ZMsEt7c
	gyhElOtuTdbB3CMJWcuZIKarjQJMbqDtWPMOTwrL2Ufm3rwexgqyL3fqeJIlWHLQbwue
	ptHUC02zZBG85OTqvvniyTSp8DsXtAzfJ5GSRwSJ18E0fbt+mOWkQathmYPQlNfhRicu
	MgWEplEoPRgmKIvwzbgAP+2XWi4edMXiG8HC0mYuQZcHD8PJDYN0PGOP3FsOCzp2l3eW
	o1NAvrMvJMpfXVGCimjm0HZI5qut9w/9brBhd0W49Vop68xWhRiAs2JJhrlaguyo+Oc2
	EaAw==
X-Gm-Message-State: APjAAAWQZuuxsgRi9xkH3MbPpn0hY5+42HLZtPtlg1AsRx3WjPclRl5X
	+iqlbjV/tq8D6OgECXbCBYibtd+e7W1vzeLZ3/Y=
X-Google-Smtp-Source: APXvYqx05fe4ZDSKkj8DtzhlAx/fiFJeaI64dRZ0m83uNjSLFzziOLGIYn8hmCPa7Od1zKTjmGCfCNg9sqX4zkgGYoE=
X-Received: by 2002:a2e:a41b:: with SMTP id p27mr17399817ljn.104.1569963510339;
	Tue, 01 Oct 2019 13:58:30 -0700 (PDT)
MIME-Version: 1.0
References: <20190930221604.113382-1-muislam@microsoft.com>
In-Reply-To: <20190930221604.113382-1-muislam@microsoft.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 1 Oct 2019 16:58:19 -0400
Message-ID: <CADkTA4OS+Cw4aSbYN4nNuJebtiE0NgxepsG7CyRtV5hh4-63aw@mail.gmail.com>
To: muislam@microsoft.com
Cc: meta-virtualization <meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH v2] kubernetes: Security fix for CVE </CVE-2018-1002105>
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
X-List-Received-Date: Tue, 01 Oct 2019 20:58:33 -0000
Content-Type: text/plain; charset="UTF-8"

What's the delta from v1 ?

Also, given that this isn't the final 1.16 kubernetes release, I'd
rather version bump than apply patches.

Bruce


On Mon, Sep 30, 2019 at 6:16 PM Muminul Islam <misla011@fiu.edu> wrote:
>
> Signed-off-by: Muminul Islam <muislam@microsoft.com>
> ---
>  .../kubernetes/CVE-2018-1002105.patch         | 87 +++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |  1 +
>  2 files changed, 88 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
>
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch b/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
> new file mode 100644
> index 0000000..505450c
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2018-1002105.patch
> @@ -0,0 +1,87 @@
> +From b2c05ca842b97090df424e0401968ba8d7ee3ecb Mon Sep 17 00:00:00 2001
> +From: Jordan Liggitt <liggitt@google.com>
> +Date: Mon, 5 Nov 2018 23:50:35 -0500
> +Subject: [PATCH] Verify backend upgraded connection
> +Reply-To: muislam@microsoft.com
> +
> +Signed-off-by: Muminul Islam <muislam@microsoft.com>
> +
> +CVE: CVE-2018-1002105
> +
> +Upstream-Status: Backport
> +---
> + .../pkg/util/proxy/upgradeaware.go            | 37 +++++++++++++++++++
> + 1 file changed, 37 insertions(+)
> +
> +diff --git a/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go b/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> +index 4d5cd34d48..b14819079c 100644
> +--- a/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> ++++ b/src/import/staging/src/k8s.io/apimachinery/pkg/util/proxy/upgradeaware.go
> +@@ -17,6 +17,7 @@ limitations under the License.
> + package proxy
> +
> + import (
> ++      "bufio"
> +       "bytes"
> +       "context"
> +       "fmt"
> +@@ -269,6 +270,18 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
> +       }
> +       defer backendConn.Close()
> +
> ++      // determine the http response code from the backend by reading from rawResponse+backendConn
> ++      rawResponseCode, headerBytes, err := getResponseCode(io.MultiReader(bytes.NewReader(rawResponse), backendConn))
> ++      if err != nil {
> ++              glog.V(6).Infof("Proxy connection error: %v", err)
> ++              h.Responder.Error(w, req, err)
> ++              return true
> ++      }
> ++      if len(headerBytes) > len(rawResponse) {
> ++              // we read beyond the bytes stored in rawResponse, update rawResponse to the full set of bytes read from the backend
> ++              rawResponse = headerBytes
> ++      }
> ++
> +       // Once the connection is hijacked, the ErrorResponder will no longer work, so
> +       // hijacking should be the last step in the upgrade.
> +       requestHijacker, ok := w.(http.Hijacker)
> +@@ -293,6 +306,17 @@ func (h *UpgradeAwareHandler) tryUpgrade(w http.ResponseWriter, req *http.Reques
> +               }
> +       }
> +
> ++      if rawResponseCode != http.StatusSwitchingProtocols {
> ++              // If the backend did not upgrade the request, finish echoing the response from the backend to the client and return, closing the connection.
> ++              glog.V(6).Infof("Proxy upgrade error, status code %d", rawResponseCode)
> ++              _, err := io.Copy(requestHijackedConn, backendConn)
> ++              if err != nil && !strings.Contains(err.Error(), "use of closed network connection") {
> ++                      glog.Errorf("Error proxying data from backend to client: %v", err)
> ++              }
> ++              // Indicate we handled the request
> ++              return true
> ++      }
> ++
> +       // Proxy the connection. This is bidirectional, so we need a goroutine
> +       // to copy in each direction. Once one side of the connection exits, we
> +       // exit the function which performs cleanup and in the process closes
> +@@ -354,6 +378,19 @@ func (h *UpgradeAwareHandler) DialForUpgrade(req *http.Request) (net.Conn, error
> +       return dial(updatedReq, h.UpgradeTransport)
> + }
> +
> ++// getResponseCode reads a http response from the given reader, returns the status code,
> ++// the bytes read from the reader, and any error encountered
> ++func getResponseCode(r io.Reader) (int, []byte, error) {
> ++      rawResponse := bytes.NewBuffer(make([]byte, 0, 256))
> ++      // Save the bytes read while reading the response headers into the rawResponse buffer
> ++      resp, err := http.ReadResponse(bufio.NewReader(io.TeeReader(r, rawResponse)), nil)
> ++      if err != nil {
> ++              return 0, nil, err
> ++      }
> ++      // return the http status code and the raw bytes consumed from the reader in the process
> ++      return resp.StatusCode, rawResponse.Bytes(), nil
> ++}
> ++
> + // dial dials the backend at req.URL and writes req to it.
> + func dial(req *http.Request, transport http.RoundTripper) (net.Conn, error) {
> +       conn, err := DialURL(req.Context(), req.URL, transport)
> +--
> +2.23.0
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index a0e0e47..b587e16 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -12,6 +12,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=master;name=kuberne
>             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>             file://0001-cross-don-t-build-tests-by-default.patch \
>             file://0001-fix-compiling-failure-execvp-bin-bash-Argument-list-.patch \
> +           file://CVE-2018-1002105.patch \
>            "
>
>  DEPENDS += "rsync-native \
> --
> 2.23.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II


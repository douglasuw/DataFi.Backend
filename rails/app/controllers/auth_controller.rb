require 'net/http'
require 'uri'
require 'json'

class AuthController < ApplicationController
  skip_before_action :verify_authenticity_token
  protect_from_forgery with: :null_session
  def index
    if session[:user_id]
      redirect_to action: 'home'
    end
  end

  # For handling signup request
  def signup
    email = params[:email]
    password = params[:password]

    uri = URI('https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyCXa0E5i2La4MJufdjdB3SJyebjTLiVbsk')

    res = Net::HTTP.post_form(uri, 'email' => email, 'password' => password)

    data = JSON.parse(res.body)

    if res.is_a?(Net::HTTPSuccess)
      redirect_to action: 'index'
    end

  end

  def login
    email = params[:email]
    password = params[:password]

    uri = URI('https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyCXa0E5i2La4MJufdjdB3SJyebjTLiVbsk')

    res = Net::HTTP.post_form(uri, 'email' => email, 'password' => password)

    data = JSON.parse(res.body)
    print(data)
    if res.is_a?(Net::HTTPSuccess)
      session[:user_id] = data['localId']

      redirect_to action: 'home'
    end
  end

  def logout
    session.clear
    redirect_to action: 'index'
  end



  def firebase_verification
    token = "eyJhbGciOiJSUzI1NiIsImtpZCI6ImxrMDJBdyJ9.eyJpc3MiOiJodHRwczovL2lkZW50aXR5dG9vbGtpdC5nb29nbGUuY29tLyIsImF1ZCI6ImRhdGFmaS01NTdkZSIsImlhdCI6MTcwNTI1OTE0NSwiZXhwIjoxNzA2NDY4NzQ1LCJ1c2VyX2lkIjoiWmdvRTdNOGJKbFNTSnFDaXpwUVdETjFRUG1yMSIsImVtYWlsIjoiY3Jpc3RvcGhlcnZpZGFsM0BnbWFpbC5jb20iLCJzaWduX2luX3Byb3ZpZGVyIjoicGFzc3dvcmQiLCJ2ZXJpZmllZCI6ZmFsc2V9.Loj6PVOcCv1mRagnmOdIHDoBNEv5Gud20OgiFoTr3T5QXbZsWU6Qctk1s4CG3pqGdxkFChXge2IGWEgVA0h5JT-PfHL7Y4Hp70IsKCv-cfBr27gBkszija5VICzfUG6e1TkJjD07vyV3FqeyXLHJaxpFAl2PJXyfq3g-ANyG9pC-wPw3VbsdyPpzmlC3B7V7Wvne35w4cDVi_PrAWZ-U1PPuuzsIw2qAveJSXtMSqs__JS5Fo7MsyEPb1SGi8GwM3ufkmZOqtHUsoTJGdLpkOTIyX0h_bMlaXPqOk3NhbnfWBMnMRituIeUH_XIHQH9Z5XBarck58V-aYh1hI7YmVQ"
    url = "https://www.googleapis.com/identitytoolkit/v3/relyingparty/getAccountInfo?key=AIzaSyCXa0E5i2La4MJufdjdB3SJyebjTLiVbsk"
    firebase_verification_call = HTTParty.post(url,
                                               headers: { 'Content-Type' => 'application/json' },
                                               body: { 'idToken' => token }.to_json )
    if firebase_verification_call.response.code == "200"
      firebase_infos = firebase_verification_call.parsed_response
      print(firebase_infos)
    else
      print(firebase_verification_call)
    end
  end
  
end
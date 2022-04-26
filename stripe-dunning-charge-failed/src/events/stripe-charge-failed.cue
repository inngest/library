{
  // The unique name of the event
  name: "stripe/charge.failed"
  // The event payload, containing all event data
  data: {
    pending_webhooks: int
    type:             string
    id:               string
    api_version:      string
    created:          int
    request: {
      id:              string
      idempotency_key: string
    }
    object: string
    data: {
      object: {
        description: string
        invoice:     string | null
        order:       string | null
        refunds: {
          url:    string
          object: string
          data: [...]
          has_more:    bool
          total_count: int
        }
        review:                 string | null
        statement_descriptor:   _
        application_fee_amount: _
        billing_details: {
          address: {
            city:        string | null
            country:     string | null
            line1:       string | null
            line2:       string | null
            postal_code: string | null
            state:       string | null
          }
          email: string | null
          name:  string | null
          phone: string | null
        }
        captured: bool
        paid:     bool
        source: {
          country:             string
          last4:               string
          id:                  string
          object:              string
          address_city:        string | null
          address_line2:       string | null
          address_state:       string | null
          address_zip_check:   string | null
          address_line1:       string | null
          cvc_check:           string | null
          dynamic_last4:       string | null
          exp_month:           int
          name:                string | null
          tokenization_method: string | null
          address_line1_check: string | null
          address_zip:         string | null
          customer:            string | null
          exp_year:            int
          fingerprint:         string
          metadata: {}
          address_country: string | null
          brand:           string
          funding:         string
        }
        statement_descriptor_suffix: _
        id:                          string
        application_fee:             _
        destination:                 _
        receipt_url:                 _
        refunded:                    bool
        status:                      string
        object:                      string
        created:                     int
        fraud_details: {}
        livemode: bool
        metadata: {}
        payment_method:                  string
        receipt_number:                  _
        currency:                        string
        failure_balance_transaction:     _
        amount_refunded:                 int
        calculated_statement_descriptor: string
        outcome: {
          risk_score:     int
          seller_message: string
          type:           string
          network_status: string
          reason:         string
          risk_level:     string
        }
        payment_method_details: {
          card: {
            three_d_secure: _
            brand:          string
            exp_year:       int
            installments:   _
            network:        string
            funding:        string
            last4:          string
            mandate:        _
            wallet:         _
            checks: {
              address_postal_code_check: _
              cvc_check:                 _
              address_line1_check:       _
            }
            country:     string
            exp_month:   int
            fingerprint: string
          }
          type: string
        }
        receipt_email:       _
        transfer_group:      _
        amount:              int
        amount_captured:     int
        on_behalf_of:        _
        customer:            _
        dispute:             _
        failure_message:     string
        payment_intent:      _
        transfer_data:       _
        application:         _
        balance_transaction: _
        shipping:            _
        source_transfer:     _
        disputed:            bool
        failure_code:        string
      }
    }
    livemode: bool
  }
  // User information for the author of the event
  user: {
    email?: string
  }

  // An optional event version
  v?: string

  // The epoch of the event, in milliseconds
  ts?: number
}